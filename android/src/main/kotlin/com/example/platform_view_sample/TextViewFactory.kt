
import android.content.Context
import android.util.Log

import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory


class TextViewFactory(
    private val messanger: BinaryMessenger
) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {

    override fun create(context: Context, viewId: Int, args: Any?): PlatformView{
//        debugPrint("PlatformViewFactory");
        Log.d("TAG", "PlatformViewFactory create")
        return FlutterTextView(context, messanger, viewId);
    }
}

