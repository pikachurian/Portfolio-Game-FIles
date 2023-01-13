using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class GameoverUI : MonoBehaviour
{
    public void RestartGame()
    {
        SceneManager.LoadScene("Title");
        Cursor.lockState = CursorLockMode.None;
    }
}
