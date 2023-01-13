using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LimitFrameRate : MonoBehaviour
{
    public int vSyncCount = 0;
    public int targetFrameRate = 30;

    void Awake()
    {
        QualitySettings.vSyncCount = vSyncCount;
        Application.targetFrameRate = targetFrameRate;
    }
}
