package com.example.just_rain

import android.content.Context
import android.hardware.Sensor
import android.hardware.SensorEvent
import android.hardware.SensorEventListener
import android.hardware.SensorManager
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.EventChannel.EventSink
import io.flutter.plugin.common.EventChannel.StreamHandler

object GravitySensorEventChannel {
	private const val eventChannel = "com.just_rain/sensor"
	var events: EventSink? = null
	private var sensorService: GravitySensorService? = null

	fun registerListener(flutterEngine: FlutterEngine) {
		sensorService = GravitySensorService()

		EventChannel(flutterEngine.dartExecutor.binaryMessenger, eventChannel)
			.setStreamHandler(
				object : StreamHandler {
					override fun onListen(arguments: Any?, es: EventSink?) {
						events = es
						if(!sensorService!!.sensorAvailable) {
							events?.error("SENSOR_UNAVAILABLE", "", {})
						}
					}

					override fun onCancel(arguments: Any?) {
						events = null
						sensorService!!.stopReceiving()
					}
				}
			)
	}

}

class GravitySensorService: SensorEventListener {
	private var sensorManager = MyApplication.getApplicationContext()
		.getSystemService(Context.SENSOR_SERVICE) as SensorManager
	private var sensor: Sensor = sensorManager.getDefaultSensor(Sensor.TYPE_GRAVITY)

	var sensorAvailable = true

	fun startReceiving() {
		sensor
	}

	fun stopReceiving() {}

	override fun onSensorChanged(p0: SensorEvent?) {
		TODO("Not yet implemented")
	}

	override fun onAccuracyChanged(p0: Sensor?, p1: Int) {
		TODO("Not yet implemented")
	}
}