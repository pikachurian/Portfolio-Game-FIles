using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LightSwitch : Interactable
{
    public bool isLightOn = false;

    public List<Light> lights;
    public List<BoxCollider> cols;

    public AudioSource aSwitchOn;
    public AudioSource aSwitchOff;

    //public GameObject goLight;

    private void Start()
    {
        SetLightOn(isLightOn);
    }
    public override void Interact()
    {
        base.Interact();
        if (isLightOn == true) isLightOn = false;
        else isLightOn = true;
        SetLightOn(isLightOn);

        Debug.Log(isLightOn);

        if (isLightOn) aSwitchOn.Play();
        else aSwitchOff.Play();
    }

    void SetLightOn(bool isOn)
    {
        foreach(Light lite in lights)
        {
            lite.enabled = isOn;
        }

        foreach(BoxCollider bCol in cols)
        {
            bCol.enabled = isOn;
        }

        if (isOn) tag = "Light Switch";
        else tag = "Untagged";
    }
}
