using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DoorOpenableLocked : Interactable
{
    public bool isOpened = false;
    public bool isLocked = true;
    public Vector3 openedRotation;
    public Vector3 closedRotation;
    public float openLerpAlpha = 0.25f;
    public float enemyTriggerRange = 1f;
    public float lerpTime = 1f;

    float lerpTick = 0f;

    Transform enemyTf;

    public BoxCollider col;
    public AudioSource audioDoorOpen;

    public MeshRenderer meshUnlocked;
    public MeshRenderer meshLocked;
    public Transform enemyTriggerTf;

    public Item key;

    private void Start()
    {
        UpdateLockMesh(isLocked);

        if (isOpened) transform.rotation = Quaternion.Euler(openedRotation);
        else transform.rotation = Quaternion.Euler(closedRotation);

        enemyTf = GameObject.FindGameObjectWithTag("Monster").transform;
    }

    private void Update()
    {
        if (lerpTick > 0)
        {
            DoorTransition();
        }
        lerpTick -= 1f * Time.deltaTime;

        if (enemyTf != null)
        {
            //Debug.Log("ENEMY LOCATED");
            //Debug.Log("Distance to enemy" + Vector3.Distance(enemyTriggerTf.position, enemyTf.position));
            if (Vector3.Distance(enemyTriggerTf.position, enemyTf.position) <= enemyTriggerRange)
            {
                //Debug.Log("Enemy in range");
                if (isOpened == false && isLocked == false)
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
        if (isLocked)
        {
            ItemController itemC = GameObject.FindGameObjectWithTag("Item Controller").GetComponent<ItemController>();
            if (Inventory.instance.items[itemC.currentItem].name == key.name)
            {
                isLocked = false;

                isOpened = !isOpened;

                UpdateLockMesh(isLocked);

                lerpTick = lerpTime;

                //Inventory.instance.Remove(key, itemC.currentItem);

                //Play Sound
                audioDoorOpen.Play();
            }else
            {
                ActTextGUI actText = GameObject.FindObjectOfType<ActTextGUI>().GetComponent<ActTextGUI>();

                if(actText != null)
                {
                    actText.ActText("I need the " + key.name);
                }
            }
        }
        else
        {
            isOpened = !isOpened;
            //UpdateCollider();

            lerpTick = lerpTime;

            //Play Sound
            audioDoorOpen.Play();
        }
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
        if (isOpened) transform.rotation = Quaternion.Euler(Vector3.Lerp(transform.rotation.eulerAngles, openedRotation, openLerpAlpha));
        else transform.rotation = Quaternion.Euler(Vector3.Lerp(transform.rotation.eulerAngles, closedRotation, openLerpAlpha));
    }

    void UpdateLockMesh(bool isLocked)
    {
        if(isLocked)
        {
            meshLocked.enabled = true;
            meshUnlocked.enabled = false;
        }
        else
        {
            meshLocked.enabled = false;
            meshUnlocked.enabled = true;
        }
    }

    private void OnDrawGizmos()
    {
        Gizmos.DrawWireSphere(enemyTriggerTf.position, enemyTriggerRange);
        //Gizmos.DrawLine(enemyTriggerTf.position, enemyTf.position);
    }
}
