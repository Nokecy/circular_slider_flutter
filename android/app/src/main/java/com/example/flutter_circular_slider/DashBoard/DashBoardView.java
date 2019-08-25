package com.example.flutter_circular_slider.DashBoard;

import android.content.Context;
import android.graphics.Color;
import android.util.AttributeSet;
import android.view.View;
import android.widget.TextView;

import com.example.flutter_circular_slider.DashBoard.bean.DashboradBean;
import com.example.flutter_circular_slider.DashBoard.bean.HighlightCR;
import com.example.flutter_circular_slider.DashBoard.view.NewDashboardView;

import java.util.ArrayList;
import java.util.List;

import io.flutter.plugin.platform.PlatformView;

public class DashBoardView implements PlatformView {

    private NewDashboardView textView;

    public DashBoardView(Context context, String text) {
        textView = new NewDashboardView(context);
    }

    @Override
    public View getView() {
        List<HighlightCR> highlights1 = new ArrayList<>();
        highlights1.add(new HighlightCR(120, 80, Color.parseColor("#4CAF50")));
        highlights1.add(new HighlightCR(200, 70, Color.parseColor("#EEC900")));
        highlights1.add(new HighlightCR(270, 150, Color.parseColor("#F44336")));
        DashboradBean dashboradBean=new DashboradBean();
        dashboradBean.setHighlightCRList(highlights1);
        dashboradBean.setAllAngle(300);
        dashboradBean.setStartAngle(120);
        dashboradBean.setBigSliceCount(5);
        dashboradBean.setSmallSliceCount(2);
        dashboradBean.setMaxValue(100);
        dashboradBean.setMinValue(0);
        dashboradBean.setIsHalf(false);
        textView.setDashboradBean(dashboradBean);
        textView.setRealTimeValue(60);
        textView.setEndText("EndText", 0, 0);
        return  textView;
    }

    @Override
    public void dispose() {

    }
}