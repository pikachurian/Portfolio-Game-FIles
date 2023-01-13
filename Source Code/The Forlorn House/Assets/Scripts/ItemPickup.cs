using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ItemPickup : Interactable
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
        bool wasPickedUp = Inventory.instance.CheckSpace(item);
        if(wasPickedUp)
        {
            isPicked = true;
            playerTf = GameObject.FindGameObjectWithTag("Player").transform;
            //Find some way to stop the collider from pushing the player
        }
    }

    void FollowPlayer()
    {
        transform.position = Vector3.Lerp(transform.position, playerTf.position,followLerpAlpha);
    }

    private void OnCollisionEnter(Collision collision)
    {
        if (isPicked && collision.transform.tag == "Player")
        {
            Debug.Log("NINTENDO DS lite");
            Inventory.instance.Add(item);
            Destroy(gameObject);
        }
    }
}
