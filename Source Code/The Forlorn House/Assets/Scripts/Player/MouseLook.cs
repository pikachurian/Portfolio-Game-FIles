using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MouseLook : MonoBehaviour
{
    public float mouseSensitivity = 10f;

    public Transform playerBody;

    float xRotation = 0f;

    // Start is called before the first frame update
    void Start()
    {
        Cursor.lockState = CursorLockMode.Locked;
    }

    // Update is called once per frame
    void Update()
    {
        float inputX = Input.GetAxis("Right Stick X") + Input.GetAxis("Mouse X");
        inputX = Mathf.Clamp(inputX, -1f, 1f);
        float inputY = Input.GetAxis("Right Stick Y") + Input.GetAxis("Mouse Y");
        inputY = Mathf.Clamp(inputY, -1f, 1f);

        /*float mouseX = inputX * mouseSensitivity;
        float mouseY = inputY * mouseSensitivity;*/
        float mouseX = Input.GetAxis("Mouse X") * mouseSensitivity;
        float mouseY = Input.GetAxis("Mouse Y") * mouseSensitivity;

        xRotation -= mouseY;
        xRotation = Mathf.Clamp(xRotation, -90f, 90f);

        transform.localRotation = Quaternion.Euler(xRotation, 0f, 0f);
        playerBody.Rotate(Vector3.up * mouseX);
    }
}
