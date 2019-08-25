package com.example.flutter_circular_slider.DashBoard;


import android.util.Log;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.StandardMessageCodec;

public class DashBoardViewRegistrant {
    private static final String TAG = DashBoardViewRegistrant.class.getName();

    public static void registerWith(PluginRegistry registry) {
        final String key = DashBoardViewRegistrant.class.getCanonicalName();
        Log.i(TAG,"registerKey="+key);
        if (registry.hasPlugin(key)) {
            return;
        }
        PluginRegistry.Registrar registrar = registry.registrarFor(key);
        registrar.platformViewRegistry().registerViewFactory("DashBoard", new DashBoardViewFactory(new StandardMessageCodec()));
    }
}
