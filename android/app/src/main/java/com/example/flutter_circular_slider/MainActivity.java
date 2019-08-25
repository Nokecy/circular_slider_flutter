package com.example.flutter_circular_slider;

import android.os.Bundle;

import com.example.flutter_circular_slider.DashBoard.DashBoardViewRegistrant;

import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
    DashBoardViewRegistrant.registerWith(this);
  }
}
