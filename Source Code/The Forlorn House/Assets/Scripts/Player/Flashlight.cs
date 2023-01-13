using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Flashlight : MonoBehaviour
{
    public float maxTriggerDistance = 8f;
    public LayerMask triggerDistanceLayerMask;
    public bool isLightOn;

    public Light lightMain;
    public BoxCollider monsterTrigger;

    // Start is called before the first frame update
    void Start()
    {
        isLightOn = lightMain.enabled;
        monsterTrigger.enabled = isLightOn;
    }

    // Update is called once per frame
    void Update()
    {
        if(Input.GetButtonDown("Fire2"))
        {
            ToggleFlashLight();
        }

        UpdateTriggerDistance();
    }

    public void ToggleFlashLight()
    {
        lightMain.enabled = !lightMain.enabled;

        isLightOn = lightMain.enabled;
        monsterTrigger.enabled = isLightOn;

        //Play Sound
        AudioManager audioManager = GameObject.FindObjectOfType<AudioManager>();
        if (audioManager != null)
        {
            if (isLightOn)
            {
                audioManager.Play("Flashlight Switch On");
            }
            else audioManager.Play("Flashlight Switch Off");
        }
    }

    void UpdateTriggerDistance()
    {
        float triggerLength = maxTriggerDistance;
        RaycastHit hit;
        if(Physics.Raycast(monsterTrigger.transform.position,monsterTrigger.transform.forward, out hit, maxTriggerDistance, triggerDistanceLayerMask))
        {
            triggerLength = hit.distance;
            //Debug.Log("FlashLightRayCast Hit "+hit.transform.name);
        }
        monsterTrigger.transform.localScale = new Vector3(monsterTrigger.transform.localScale.x, monsterTrigger.transform.localScale.y, triggerLength);
    }
}
