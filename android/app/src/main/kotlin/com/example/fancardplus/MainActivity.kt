package com.example.fancardplus

import android.content.Intent
import android.util.Log
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


class MainActivity: FlutterFragmentActivity() {

    private val CHANNEL = "fancardplus-user-id-nfc"

    private fun sendDataToService(id: String) {
        val intent1 = Intent("broadcast_nfc").putExtra("student_id", id)
        sendBroadcast(intent1)
    }
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        // Set up the MethodChannel with the same name as defined in Dart
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "startNFCHCE") {


                val value = call.arguments

                Log.i("value", value.toString());

                sendDataToService(value.toString())

                result.success("Android ${value.toString()}");

                // Perform platform-specific operations and obtain the result
//                val data = getDataFromNative()

//                val apduService = HostApduService.

                // Send the result back to Flutter
//                result.success(data)
            } else {
                result.notImplemented()
            }
        }
    }

}
