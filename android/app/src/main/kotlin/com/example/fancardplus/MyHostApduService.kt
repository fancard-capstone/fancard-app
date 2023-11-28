package com.example.fancardplus

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.nfc.cardemulation.HostApduService
import android.os.Bundle
import android.util.Log

class MyHostApduService : HostApduService() {

    private val serviceBroadcastReceiver = object : BroadcastReceiver() {
        override fun onReceive(context: Context, intent: Intent) {
            val number = intent.getStringExtra("student_id")
            Log.d("MyHostApduService", "onReceive number = $number")
            val apduToReturn = number.toString().toByteArray()
            sendResponseApdu(apduToReturn)
        }
    }

    override fun onCreate() {
        super.onCreate()
        val intentFilter = IntentFilter("broadcast_nfc")
        registerReceiver(serviceBroadcastReceiver, intentFilter)
    }

    override fun processCommandApdu(commandApdu: ByteArray, extras: Bundle?): ByteArray? {
        return null;
    }

    override fun onDeactivated(reason: Int) {
    }
}