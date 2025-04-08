package br.com.andrevicente.immottumobile.im_mottu_mobile

import android.net.ConnectivityManager
import android.net.Network
import android.net.NetworkCapabilities
import android.net.NetworkCapabilities.NET_CAPABILITY_INTERNET
import android.net.NetworkRequest
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.EventChannel
import io.flutter.embedding.engine.FlutterEngine

class MainActivity: FlutterActivity() {
    private val CHANNEL = "br.com.andrevicente.immottumobile.im_mottu_mobile/connection"
    private var events: EventChannel.EventSink? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        EventChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setStreamHandler(
            object : EventChannel.StreamHandler {
                override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                    this@MainActivity.events = events
                    startSendingEvents()
                }

                override fun onCancel(arguments: Any?) {
                    this@MainActivity.events = null
                }
            }
        )
    }

    private fun sendEvent(isConnected: Boolean) {
        runOnUiThread {
            events?.success(isConnected)
        }
    }

    private fun startSendingEvents() {

        val connectivityManager: ConnectivityManager? =
            context.getSystemService(CONNECTIVITY_SERVICE) as ConnectivityManager

        val networkCallback =  object : ConnectivityManager.NetworkCallback() {
            override fun onAvailable(network: Network) {
                connectivityManager?.getNetworkCapabilities(network)?.let {
                    if (it.hasCapability(NET_CAPABILITY_INTERNET)) {
                        sendEvent(true)
                    }
                }
            }

            override fun onLost(network: Network) {
                sendEvent(false)
            }

            override fun onUnavailable() {
                sendEvent(false)
            }
        }

        val networkRequest = NetworkRequest.Builder()
            .addCapability(NET_CAPABILITY_INTERNET)
            .addTransportType(NetworkCapabilities.TRANSPORT_WIFI)
            .addTransportType(NetworkCapabilities.TRANSPORT_ETHERNET)
            .addTransportType(NetworkCapabilities.TRANSPORT_CELLULAR)
            .build()

        connectivityManager?.registerNetworkCallback(networkRequest, networkCallback)

    }
}
