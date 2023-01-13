using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ItemController : MonoBehaviour
{
    #region Beta
    public Dictionary<string, GameObject> item;

    public void ShowItem(string id)
    {
        if (id != null || id != "null")
        {
            item[id].SetActive(true);


        }
    }
    #endregion

    public int currentItem = 0;

    public GameObject flashlight;
    public GameObject key;

    Flashlight scriptFlashlight;

    int previousSelectedItem;

    private void Start()
    {
        //ActivateItem(Inventory.instance.items[currentItem].name);
        scriptFlashlight = flashlight.GetComponent<Flashlight>();
    }

    private void Update()
    {
        previousSelectedItem = currentItem;

        ItemSelectInput();

        ////if (previousSelectedItem != currentItem)
        //{
            ActivateItem(Inventory.instance.items[currentItem].name);
        //}
    }

    public void ActivateItem(string itemName)
    {
        switch(itemName)
        {
            case "Null":
                key.SetActive(false);
                if (scriptFlashlight.isLightOn) scriptFlashlight.ToggleFlashLight();
                flashlight.SetActive(false);
                break;
            case "Key":
                key.SetActive(true);
                if (scriptFlashlight.isLightOn) scriptFlashlight.ToggleFlashLight();
                flashlight.SetActive(false);
                break;

            case "Flashlight":
                key.SetActive(false);
                flashlight.SetActive(true);
                break;
            #region Keys
            case "Attic Key":
                key.SetActive(true);
                if (scriptFlashlight.isLightOn) scriptFlashlight.ToggleFlashLight();
                flashlight.SetActive(false);
                break;
            case "Backroom Key":
                key.SetActive(true);
                if (scriptFlashlight.isLightOn) scriptFlashlight.ToggleFlashLight();
                flashlight.SetActive(false);
                break;
            case "Basement Key":
                key.SetActive(true);
                if (scriptFlashlight.isLightOn) scriptFlashlight.ToggleFlashLight();
                flashlight.SetActive(false);
                break;
            case "Bedroom Key":
                key.SetActive(true);
                if (scriptFlashlight.isLightOn) scriptFlashlight.ToggleFlashLight();
                flashlight.SetActive(false);
                break;
            case "Closet Key":
                key.SetActive(true);
                if (scriptFlashlight.isLightOn) scriptFlashlight.ToggleFlashLight();
                flashlight.SetActive(false);
                break;
            case "Front Door Key":
                key.SetActive(true);
                if (scriptFlashlight.isLightOn) scriptFlashlight.ToggleFlashLight();
                flashlight.SetActive(false);
                break;
            case "Restroom Key":
                key.SetActive(true);
                if (scriptFlashlight.isLightOn) scriptFlashlight.ToggleFlashLight();
                flashlight.SetActive(false);
                break;
                #endregion
        }
    }

    void ItemSelectInput()
    {
        #region Scroll Wheel
        if (Input.GetAxis("Mouse ScrollWheel") > 0f)
        {
            if (currentItem >= Inventory.instance.items.Length - 1)
                currentItem = 0;
            else
                currentItem++;
            /*if (Inventory.instance.items[previousSelectedItem].name == "Null")
            {
                while (Inventory.instance.items[currentItem].name == "Null")
                {
                    if (currentItem >= Inventory.instance.items.Length - 1)
                        currentItem = 0;
                    else
                        currentItem++;
                }
            }*/
        }

        if (Input.GetAxis("Mouse ScrollWheel") < 0f)
        {
            if (currentItem <= 0)
                currentItem = Inventory.instance.items.Length - 1;
            else
                currentItem--;

            /*if (Inventory.instance.items[previousSelectedItem].name == "Null")
            {
                while (Inventory.instance.items[currentItem].name == "Null")
                {
                    if (currentItem <= 0)
                        currentItem = Inventory.instance.items.Length - 1;
                    else
                        currentItem--;
                }
            }*/
        }
        #endregion

        #region Numpad
        if (Input.GetKeyDown(KeyCode.Alpha1)) currentItem = 0;
        if (Input.GetKeyDown(KeyCode.Alpha2)) currentItem = 1;
        if (Input.GetKeyDown(KeyCode.Alpha3)) currentItem = 2;
        if (Input.GetKeyDown(KeyCode.Alpha4)) currentItem = 3;
        if (Input.GetKeyDown(KeyCode.Alpha5)) currentItem = 4;
        if (Input.GetKeyDown(KeyCode.Alpha6)) currentItem = 5;
        if (Input.GetKeyDown(KeyCode.Alpha7)) currentItem = 6;
        if (Input.GetKeyDown(KeyCode.Alpha8)) currentItem = 7;
        if (Input.GetKeyDown(KeyCode.Alpha9)) currentItem = 8;
        #endregion
    }

}
