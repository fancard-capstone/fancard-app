package com.fanshawe.fancardplus

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.util.Log
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

var StudentId = "";
class MainActivity: FlutterFragmentActivity() {

    private val CHANNEL = "fancardplus-user-id-nfc"
    private lateinit var channel:  MethodChannel;

    private lateinit var methodResult: MethodChannel.Result;


    private var errorValues = "error";

    private fun sendDataToSharedSettings(id: String) {
        StudentId = id;
    }


    private val activityBroadcastReceiver = object : BroadcastReceiver() {
        override fun onReceive(context: Context, intent: Intent) {
            val error = intent.getStringExtra("error")
            errorValues = error.toString();
            methodResult.success(errorValues)
        }
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        channel =  MethodChannel (flutterEngine.dartExecutor.binaryMessenger, "debuggingNfc")

        // Set up the MethodChannel with the same name as defined in Dart
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->

            this.methodResult = result;

            if (call.method == "startNFCHCE") {
                val value = call.arguments;

                Log.d("main activity value", value.toString());

                sendDataToSharedSettings(value.toString());

            } else {
                result.notImplemented();
            }
        }
    }

    override fun onStart() {
        super.onStart()

        val intentFilter = IntentFilter("debuggingNfc")
        registerReceiver(activityBroadcastReceiver, intentFilter)
    }

    override fun onStop() {
        super.onStop()
        unregisterReceiver(activityBroadcastReceiver)
    }

    override fun onDestroy() {
        super.onDestroy()
    }

}
