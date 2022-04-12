

import android.content.Context;
import android.view.View
import android.widget.TextView
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView

import android.util.Log

class FlutterTextView(
    context: Context,
    messenger: BinaryMessenger,
    id: Int
) : PlatformView, MethodChannel.MethodCallHandler {
    private val textView: TextView = TextView(context);

    init {
        Log.d(" --- ", " ---- FlutterTextView init")
        textView.text = "Hello World!"
        MethodChannel(messenger, "plugins.team.itome/textview_$id").also {
            it.setMethodCallHandler(this)
        }
    }

    override fun getView(): View = textView

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "setText" -> {
//                textView.text = call.arguments as String

                Log.d(" --- ", " ---- FlutterTextView onMethodCall")
                textView.text = "aaaaa bbbbb ccccc";
                result.success(null)
            }
            else -> result.notImplemented()
        }
    }

    override fun dispose() {
    }
}
