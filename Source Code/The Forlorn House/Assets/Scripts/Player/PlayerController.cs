using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour
{
    public float actRange = 2f;
    public LayerMask actLayerMask;

    public Transform playerCam;
    public ItemController itemC;
    // Start is called before the first frame update
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {
        Interact();
    }

    void Interact()
    {
        if (Input.GetKeyDown(KeyCode.E))
        {
            RaycastHit hit;
            if (Physics.Raycast(playerCam.transform.position, playerCam.forward, out hit, actRange, actLayerMask))
            {
                Interactable hitAct = hit.transform.GetComponent<Interactable>();
                if (hitAct != null)
                {
                    if (hit.transform.GetComponent<ItemPickup>()) itemC.ActivateItem(Inventory.instance.items[itemC.currentItem].name);
                    hitAct.Interact();
                }
                else Debug.Log("You give the air a high five");
            }else Debug.Log("You give the air a high five");
        }
    }
} 
