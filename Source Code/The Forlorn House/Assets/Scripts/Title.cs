using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class Title : MonoBehaviour
{
    AudioManager audioM;
    public GameObject mainMenu;
    public GameObject warning;
    public GameObject startup;

    private void Start()
    {
        audioM = GameObject.FindObjectOfType<AudioManager>();
    }

    public void StartGame()
    {
        SceneManager.LoadScene("Level 1");
        if (audioM != null) audioM.StopPlaying("Title");
    }

    public void QuitGame()
    {
        Application.Quit();
    }

    public void ActivateTitle()
    {
        if (mainMenu != null) mainMenu.SetActive(true);
        if (warning != null) warning.SetActive(false);
        if (startup != null) startup.SetActive(false);
    }

    public void AudioPlayStartup()
    {
        if (audioM != null) audioM.Play("Startup");
    }

    public void AudioPlayTitle()
    {
        if (audioM != null) audioM.Play("Title");
    }
}
