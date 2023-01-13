using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DoorOpenable : Interactable
{
    public bool isOpened = false;
    public Vector3 openedRotation;
    public Vector3 closedRotation;
    public float openLerpAlpha = 0.25f;
    public float enemyTriggerRange = 1f;
    public float lerpTime = 1f;

    float lerpTick = 0f;

    Transform enemyTf;

    public BoxCollider col;
    public BoxCollider enemyTrigger;
    public Transform enemyTriggerTf;
    public AudioSource audioDoorOpen;

    private void Start()
    {
        if (isOpened) transform.rotation = Quaternion.Euler(openedRotation);
        else transform.rotation = Quaternion.Euler(closedRotation);

        enemyTf = GameObject.FindGameObjectWithTag("Monster").transform;
    }

    private void Update()
    {
        if(lerpTick > 0)
        {
            DoorTransition();
        }lerpTick -= 1f * Time.deltaTime;

        if(enemyTf != null)
        {
            //Debug.Log("ENEMY LOCATED");
            //Debug.Log("Distance to enemy" + Vector3.Distance(enemyTriggerTf.position, enemyTf.position));
            if (Vector3.Distance(enemyTriggerTf.position, enemyTf.position) <= enemyTriggerRange)
            {
                //Debug.Log("Enemy in range");
                if (isOpened == false)
                {
                    isOpened = true;

                    lerpTick = lerpTime;

                    audioDoorOpen.Play();
                }
            }
        }
    }

    public override void Interact()
    {
        base.Interact();

        isOpened = !isOpened;
        //UpdateCollider();

        lerpTick = lerpTime;
        //Play Sound
        //AudioManager audioManager = GameObject.FindObjectOfType<AudioManager>();
        //if (audioManager != null) audioManager.Play("Door Open");
        audioDoorOpen.Play();
    }

    void UpdateCollider()
    {
        if (isOpened)
        {
            col.isTrigger = true;
        }
        else col.isTrigger = false;
    }

    void DoorTransition()
    {
        if(isOpened)transform.rotation = Quaternion.Euler(Vector3.Lerp(transform.rotation.eulerAngles, openedRotation, openLerpAlpha));
        else transform.rotation = Quaternion.Euler(Vector3.Lerp(transform.rotation.eulerAngles, closedRotation, openLerpAlpha));
    }

    #region
    /*private void OnTriggerEnter(Collider other)
    {
        Debug.Log("Trigger hit "+ other.name);
        if (other.tag == "Monster")
        {
            if (isOpened == false)
            {
                isOpened = true;

                lerpTick = lerpTime;

                audioDoorOpen.Play();
            }
        }
    }*/
    #endregion

    private void OnDrawGizmos()
    {
        Gizmos.DrawWireSphere(enemyTriggerTf.position, enemyTriggerRange);
        //Gizmos.DrawLine(enemyTriggerTf.position, enemyTf.position);
    }
}
