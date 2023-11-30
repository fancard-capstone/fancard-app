package com.fanshawe.fancardplus

import android.content.Intent
import android.nfc.cardemulation.HostApduService
import android.os.Bundle
import android.util.Log


class MyHostApduService : HostApduService() {
    private fun sendDataToActivity(message: String) {
        val intent1 = Intent("debuggingNfc").putExtra("error", message)
        sendBroadcast(intent1)
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        return super.onStartCommand(intent, flags, startId)
    }

    override fun processCommandApdu(commandApdu: ByteArray, extras: Bundle?): ByteArray? {
        return StudentId.toByteArray()
    }

    override fun onDeactivated(reason: Int) {
        Log.d("onDeactivated", reason.toString());
        sendDataToActivity("This thing is coming all the way from the nfc class")
    }
}