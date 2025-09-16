package com.example.isar_app

import android.content.Intent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.example.isar_app/widget"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "updateWidget" -> {
                    try {
                        // Send broadcast to update widget
                        val intent = Intent("com.example.isar_app.WIDGET_UPDATE")
                        sendBroadcast(intent)
                        result.success("Widget update broadcast sent")
                    } catch (e: Exception) {
                        result.error("UPDATE_FAILED", "Failed to send widget update broadcast", e.message)
                    }
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }
}
