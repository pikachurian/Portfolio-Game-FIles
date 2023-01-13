using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SanityZone : MonoBehaviour
{
    public float restoreRate = 5f;

    public BoxCollider bCol;

    private void OnTriggerStay(Collider other)
    {
        if(other.tag == "Player")
        {
            Debug.Log("restore");
            PlayerSanity pSanity = other.GetComponent<PlayerSanity>();
            //if (pSanity != null) Debug.Log("You have sanity");
            pSanity.AddSanity(restoreRate * Time.deltaTime);
            //pSanity.inLight = true;
            pSanity.drainSanity = false;
            //Debug.Log("I see you P L A Y E R");
        }
    }
}
