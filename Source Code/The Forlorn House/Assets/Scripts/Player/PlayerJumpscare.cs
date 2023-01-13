using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerJumpscare : MonoBehaviour
{
    public bool isJumped = false;
    public bool isJumpscared = false;
    public float jumpscareStartTime = 5f;
    public float jumpscareTime = 10f;
    public float jumpscareAngle = 90f;
    [HideInInspector]
    public Vector3 jumpedAngle;

    public float monsterJumpscareLerpAlpha = 0.25f;

    public Transform jumpscareMonsterTf;
    public Transform jumpscareStartTf;
    public Transform jumpscareEndTf;
    public Light jumpscareLight;
    public AudioManager audioManager;
    public GameObject goGameoverUI;

    float jumpscareStartTick;
    float jumpscareTick;

    bool hasJumpedAngleSet = false;
    bool hasJumpscareAudioPlayed = false;

    public Flashlight flashlight;

    private void Start()
    {
        isJumped = false;
        isJumpscared = false;
        hasJumpedAngleSet = false;
        hasJumpscareAudioPlayed = false;
        jumpscareStartTick = jumpscareStartTime;
        jumpscareTick = jumpscareTime;
        //jumpedAngle = null;

        //if (audioManager == null) audioManager = GameObject.FindObjectOfType<AudioManager>();
        if (jumpscareMonsterTf != null) jumpscareMonsterTf.position = jumpscareStartTf.position;
        if (jumpscareLight != null) if (jumpscareLight.enabled == true) jumpscareLight.enabled = false;
    }

    private void Update()
    {
        if(isJumped)
        {
            if (jumpscareStartTick <= 0)
            {
                if(isJumpscared)
                {
                    if (jumpscareLight.enabled == false) jumpscareLight.enabled = true;
                    if (hasJumpscareAudioPlayed == false)
                    {
                        Debug.Log("OOGBOOGA!!!");
                        hasJumpscareAudioPlayed = true;
                        if (flashlight != null) if (flashlight.isLightOn) flashlight.ToggleFlashLight();
                        AudioManager.instance.Play("Jumpscare");
                        goGameoverUI.SetActive(true);
                    }
                    jumpscareMonsterTf.position = Vector3.Lerp(jumpscareMonsterTf.position, jumpscareEndTf.position, monsterJumpscareLerpAlpha);
                }else if (hasJumpedAngleSet == false)
                {
                    hasJumpedAngleSet = true;
                    jumpedAngle = transform.forward;
                    Debug.Log("Set Jumped Angle");
                }
                if (jumpscareTick <= 0)
                {
                    Debug.Log("Jumpscared by Time");
                    isJumpscared = true;
                }
                else if(Vector3.Angle(transform.forward, jumpedAngle) >= jumpscareAngle)
                {
                    Debug.Log("Jumpscared by Angle");
                    isJumpscared = true;
                }else jumpscareTick -= 1 * Time.deltaTime;
            }
            else jumpscareStartTick -= 1 * Time.deltaTime;
        }
    }

    public void Jump()
    {
        isJumped = true;
        //jumpedAngle = transform.forward;
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.transform.tag == "Monster")
        {
            Debug.Log("Touch Monster");
            Jump();
            Destroy(other.gameObject);
        }
    }
}