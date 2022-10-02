using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Runtime.InteropServices;
using AOT;

public class ButtonControllerScript : MonoBehaviour
{

    [DllImport("__Internal")]
    private static extern void startSwiftCodeKitController();

    [DllImport("__Internal")]
    private static extern void swiftCodeKitConfigureMinMax(double min, double max);

    [DllImport("__Internal")]
    private static extern void swiftCodeKitConfigureValue(double value);

    [DllImport("__Internal")]
    private static extern double swiftCodeKitGetValue();

    [DllImport("__Internal")]
    private static extern string swiftCodeKitGetVersion();

    // Delegates

    public delegate void SwiftCodeKitDidStartDelegate();
    [DllImport("__Internal")]
    private static extern void setSwiftCodeKitDidStart(SwiftCodeKitDidStartDelegate callBack);

    public delegate void SwiftCodeKitDidFinishDelegate();
    [DllImport("__Internal")]
    private static extern void setSwiftCodeKitDidFinish(SwiftCodeKitDidFinishDelegate callBack);

    public delegate void SwiftCodeKitStepperValueDidChange(double value);
    [DllImport("__Internal")]
    private static extern void setSwiftCodeKitStepperValueDidChange(SwiftCodeKitStepperValueDidChange callBack);

    // On Press Button

    public void OnPressButton()
    {
        startSwiftCodeKitController();

        swiftCodeKitConfigureMinMax(0, 20);
        swiftCodeKitConfigureValue(10);

        Debug.Log("SwiftCodeKit get value: " + swiftCodeKitGetValue());
        Debug.Log("SwiftCodeKit get version: " + swiftCodeKitGetVersion());

        setSwiftCodeKitDidStart(swiftCodeKitDidStart);
        setSwiftCodeKitDidFinish(swiftCodeKitDidFinish);
        setSwiftCodeKitStepperValueDidChange(setSwiftCodeKitStepperValueDidChange);
    }

    // Handle delegates

    [MonoPInvokeCallback(typeof(SwiftCodeKitDidStartDelegate))]
    public static void swiftCodeKitDidStart()
    {
        Debug.Log("SwiftCodeKit did start");
    }

    [MonoPInvokeCallback(typeof(SwiftCodeKitDidFinishDelegate))]
    public static void swiftCodeKitDidFinish()
    {
        Debug.Log("SwiftCodeKit did finish");
    }

    [MonoPInvokeCallback(typeof(SwiftCodeKitStepperValueDidChange))]
    public static void setSwiftCodeKitStepperValueDidChange(double value)
    {
        Debug.Log("SwiftCodeKit value did change. Value: " + value);
    }
}
