using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerSanity : MonoBehaviour
{
    public float sanityMax = 100f;
    public bool drainSanity = false;
    public float drainSanityRate = 2f;

    public bool inLight = false;

    public Flashlight flashlight;
    public PlayerJumpscare pJumpscare;

    public float sanityCurrent = 75f;//This is public for debug purposes, yes I am lazy

    bool hasAddedSanity = false;

    public void Start()
    {
        
    }

    private void Update()
    {
        if (flashlight.isLightOn == true)
        {
            //Debug.Log("Don't drain sanity");
            drainSanity = false;
        }

        if (drainSanity)
        {
            //Debug.Log("Draining sanity");
            AddSanity(-drainSanityRate * Time.deltaTime);
        }

        if(sanityCurrent <= 0)
        {
            if (pJumpscare != null) pJumpscare.Jump();
        }

    }


    private void LateUpdate()
    {
        drainSanity = true;
        hasAddedSanity = false;
    }

    public void AddSanity(float amount)
    {
        if (amount > 0 && hasAddedSanity == false)
        {
            sanityCurrent += amount;

            if (sanityCurrent >= sanityMax) sanityCurrent = sanityMax;

            if (sanityCurrent <= 0) sanityCurrent = 0;

            hasAddedSanity = true;
        }else if(amount < 0)
        {
            sanityCurrent += amount;

            if (sanityCurrent >= sanityMax) sanityCurrent = sanityMax;

            if (sanityCurrent <= 0) sanityCurrent = 0;
        }
    }
}
