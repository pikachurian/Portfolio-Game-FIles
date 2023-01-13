using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ItemPickupCHASE : Interactable
{
    public Item item;
    public float followLerpAlpha = 0.25f;

    bool isPicked = false;

    Transform playerTf;

    void Start()
    {

    }


    void Update()
    {
        if (isPicked) FollowPlayer();
    }

    public override void Interact()
    {
        if (isPicked == false)
        {
            base.Interact();

            PickUp();
        }
    }

    void PickUp()
    {
        Debug.Log("Picking up " + item.name);
        isPicked = true;
        playerTf = GameObject.FindGameObjectWithTag("Player").transform;
    }

    void FollowPlayer()
    {
        transform.position = Vector3.Lerp(transform.position, playerTf.position,followLerpAlpha);
    }

    private void OnCollisionEnter(Collision collision)
    {
            Inventory.instance.Add(item);
            Destroy(gameObject);
    }
}
