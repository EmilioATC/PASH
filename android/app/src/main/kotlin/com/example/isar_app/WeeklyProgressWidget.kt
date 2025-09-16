package com.example.isar_app

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.content.Intent
import android.widget.RemoteViews
import es.antonborri.home_widget.HomeWidgetPlugin
import org.json.JSONObject
import android.net.Uri
import android.app.PendingIntent
import kotlin.math.min

class WeeklyProgressWidget : AppWidgetProvider() {

    override fun onUpdate(context: Context, appWidgetManager: AppWidgetManager, appWidgetIds: IntArray) {
        for (appWidgetId in appWidgetIds) {
            updateAppWidget(context, appWidgetManager, appWidgetId)
        }
    }

    override fun onReceive(context: Context, intent: Intent) {
        super.onReceive(context, intent)

        // Handle widget click
        if (intent.action == "es.antonborri.home_widget.action.CLICK") {
            val action = intent.getStringExtra("action")
            when (action) {
                "open_app" -> {
                    // Open the main app
                    val launchIntent = context.packageManager.getLaunchIntentForPackage(context.packageName)
                    launchIntent?.let { context.startActivity(it) }
                }
                "show_progress" -> {
                    // This will be handled by the Flutter side
                }
                "refresh" -> {
                    // Refresh widget data
                    val appWidgetManager = AppWidgetManager.getInstance(context)
                    val appWidgetIds = appWidgetManager.getAppWidgetIds(
                        android.content.ComponentName(context, WeeklyProgressWidget::class.java)
                    )
                    onUpdate(context, appWidgetManager, appWidgetIds)
                }
            }
        }

        // Handle data update broadcasts from Flutter
        if (intent.action == "com.example.isar_app.WIDGET_UPDATE") {
            android.util.Log.d("WeeklyProgressWidget", "Received widget update broadcast")
            // Refresh all widget instances
            val appWidgetManager = AppWidgetManager.getInstance(context)
            val appWidgetIds = appWidgetManager.getAppWidgetIds(
                android.content.ComponentName(context, WeeklyProgressWidget::class.java)
            )
            onUpdate(context, appWidgetManager, appWidgetIds)
        }
    }
}

internal fun updateAppWidget(context: Context, appWidgetManager: AppWidgetManager, appWidgetId: Int) {
    // Use resource identifiers directly - Flutter generates these at build time
    val layoutId = context.resources.getIdentifier("weekly_progress_widget", "layout", context.packageName)
    val views = RemoteViews(context.packageName, layoutId)

    // Get all resource IDs dynamically
    val emptyMessageId = context.resources.getIdentifier("widget_empty_message", "id", context.packageName)
    val titleId = context.resources.getIdentifier("widget_title", "id", context.packageName)
    val progressTotalId = context.resources.getIdentifier("widget_progress_total", "id", context.packageName)
    val totalPointsId = context.resources.getIdentifier("widget_total_points", "id", context.packageName)

    val completadasId = context.resources.getIdentifier("widget_completadas", "id", context.packageName)
    val enProgresoId = context.resources.getIdentifier("widget_enProgreso", "id", context.packageName)
    val pendientesId = context.resources.getIdentifier("widget_pendientes", "id", context.packageName)
    val progressBarId = context.resources.getIdentifier("widget_progress_bar", "id", context.packageName)

    try {
        // Get widget data from SharedPreferences
        val widgetData = HomeWidgetPlugin.getData(context)
        val jsonString = widgetData?.getString("widgetData", null)

        if (jsonString != null) {
            val jsonObject = JSONObject(jsonString)
            val estado = jsonObject.optString("estado", "normal")
            // android.util.Log.d("Estado", "Layout ID: $estado")
            when (estado) {
                "vacio" -> {
                    // Show empty state
                    views.setTextViewText(emptyMessageId, jsonObject.optString("mensaje", "No hay actividades"))
                    views.setViewVisibility(emptyMessageId, android.view.View.GONE)
                    views.setViewVisibility(titleId, android.view.View.VISIBLE)
                    views.setViewVisibility(progressTotalId, android.view.View.VISIBLE)
                    views.setViewVisibility(totalPointsId, android.view.View.VISIBLE)
                    views.setViewVisibility(completadasId, android.view.View.VISIBLE)
                    views.setViewVisibility(enProgresoId, android.view.View.VISIBLE)
                    views.setViewVisibility(pendientesId, android.view.View.VISIBLE)
                    views.setViewVisibility(progressBarId, android.view.View.VISIBLE)

                    views.setTextViewText(titleId, "Semana:")
                    views.setTextViewText(progressTotalId, "0%")
                    views.setTextViewText(totalPointsId, "0")
                    views.setTextViewText(completadasId, "0")
                    views.setTextViewText(enProgresoId, "0")
                    views.setTextViewText(pendientesId, "0")
                    views.setProgressBar(progressBarId, 100, 0, false)
                }
                "error" -> {
                    // Show error state
                    views.setViewVisibility(emptyMessageId, android.view.View.GONE)
                    views.setViewVisibility(titleId, android.view.View.VISIBLE)
                    views.setViewVisibility(progressTotalId, android.view.View.VISIBLE)
                    views.setViewVisibility(totalPointsId, android.view.View.VISIBLE)
                    views.setViewVisibility(completadasId, android.view.View.VISIBLE)
                    views.setViewVisibility(enProgresoId, android.view.View.VISIBLE)
                    views.setViewVisibility(pendientesId, android.view.View.VISIBLE)
                    views.setViewVisibility(progressBarId, android.view.View.VISIBLE)

                    views.setTextViewText(titleId, "Semana:")
                    views.setTextViewText(progressTotalId, "0%")
                    views.setTextViewText(totalPointsId, "0")
                    views.setTextViewText(completadasId, "0")
                    views.setTextViewText(enProgresoId, "0")
                    views.setTextViewText(pendientesId, "0")
                    views.setProgressBar(progressBarId, 100, 0, false)
                    
                }
                else -> {
                    // Show normal data
                    views.setViewVisibility(emptyMessageId, android.view.View.GONE)
                    views.setViewVisibility(titleId, android.view.View.VISIBLE)
                    views.setViewVisibility(progressTotalId, android.view.View.VISIBLE)
                    views.setViewVisibility(totalPointsId, android.view.View.VISIBLE)
                    views.setViewVisibility(completadasId, android.view.View.VISIBLE)
                    views.setViewVisibility(enProgresoId, android.view.View.VISIBLE)
                    views.setViewVisibility(pendientesId, android.view.View.VISIBLE)
                    views.setViewVisibility(progressBarId, android.view.View.VISIBLE)

                    // Set title and progress
                    val semanaNombre = jsonObject.optString("semanaNombre", "Semana:")
                    val progresoTotal = jsonObject.optInt("progresoTotal", 0)
                    val puntosTotales = jsonObject.optInt("puntosTotales", 0)
                    val completadas = jsonObject.optInt("actividadesCompletadas", 0)
                    val enProgreso = jsonObject.optInt("actividadesEnProgreso", 0)
                    val pendientes = jsonObject.optInt("actividadesPendientes", 0)

                    views.setTextViewText(titleId, semanaNombre)
                    views.setTextViewText(progressTotalId, "$progresoTotal%")
                    views.setTextViewText(totalPointsId, formatPoints(puntosTotales))
                    views.setTextViewText(completadasId, completadas.toString())
                    views.setTextViewText(enProgresoId, enProgreso.toString())
                    views.setTextViewText(pendientesId, pendientes.toString())
                    views.setProgressBar(progressBarId, 100, progresoTotal, false)
                }
            }
        } else {
            // No data available
            views.setTextViewText(emptyMessageId, "No hay datos disponibles")
            views.setViewVisibility(emptyMessageId, android.view.View.GONE)
            views.setViewVisibility(titleId, android.view.View.VISIBLE)
            views.setViewVisibility(progressTotalId, android.view.View.VISIBLE)
            views.setViewVisibility(totalPointsId, android.view.View.VISIBLE)
            views.setViewVisibility(completadasId, android.view.View.VISIBLE)
            views.setViewVisibility(enProgresoId, android.view.View.VISIBLE)
            views.setViewVisibility(pendientesId, android.view.View.VISIBLE)
            views.setViewVisibility(progressBarId, android.view.View.VISIBLE)

            views.setTextViewText(titleId, "Semana:")
            views.setTextViewText(progressTotalId, "0%")
            views.setTextViewText(totalPointsId, "0")
            views.setTextViewText(completadasId, "0")
            views.setTextViewText(enProgresoId, "0")
            views.setTextViewText(pendientesId, "0")
            views.setProgressBar(progressBarId, 100, 0, false)
        }

        // Set up click handlers
        val openAppIntent = Intent(context, MainActivity::class.java).apply {
            action = "es.antonborri.home_widget.action.CLICK"
            putExtra("action", "open_app")
        }
        val openAppPendingIntent = PendingIntent.getActivity(
            context,
            0,
            openAppIntent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )
        views.setOnClickPendingIntent(titleId, openAppPendingIntent)

        val showProgressIntent = Intent(context, MainActivity::class.java).apply {
            action = "es.antonborri.home_widget.action.CLICK"
            putExtra("action", "show_progress")
        }
        val showProgressPendingIntent = PendingIntent.getActivity(
            context,
            1,
            showProgressIntent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )
        views.setOnClickPendingIntent(progressTotalId, showProgressPendingIntent)

    } catch (e: Exception) {
        e.printStackTrace()
        // Show error state
        views.setTextViewText(emptyMessageId, "Error al cargar datos")
        views.setViewVisibility(emptyMessageId, android.view.View.GONE)
        views.setViewVisibility(titleId, android.view.View.VISIBLE)
        views.setViewVisibility(progressTotalId, android.view.View.VISIBLE)
        views.setViewVisibility(totalPointsId, android.view.View.VISIBLE)
        views.setViewVisibility(completadasId, android.view.View.VISIBLE)
        views.setViewVisibility(enProgresoId, android.view.View.VISIBLE)
        views.setViewVisibility(pendientesId, android.view.View.VISIBLE)
        views.setViewVisibility(progressBarId, android.view.View.VISIBLE)

        views.setTextViewText(titleId, "Semana:")
        views.setTextViewText(progressTotalId, "0%")
        views.setTextViewText(totalPointsId, "0")
        views.setTextViewText(completadasId, "0")
        views.setTextViewText(enProgresoId, "0")
        views.setTextViewText(pendientesId, "0")
        views.setProgressBar(progressBarId, 100, 0, false)
    }

    // Update the widget
    appWidgetManager.updateAppWidget(appWidgetId, views)
}

private fun formatPoints(points: Int): String {
    return when {
        points >= 1000000 -> "${points / 1000000}.${(points % 1000000) / 100000}M"
        points >= 1000 -> "${points / 1000}.${(points % 1000) / 100}K"
        else -> points.toString()
    }
}