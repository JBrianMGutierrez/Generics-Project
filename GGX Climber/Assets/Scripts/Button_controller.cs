using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class Button_controller : MonoBehaviour {
	public void StartGame()
	{
		SceneManager.LoadScene ("DevelopmentScene");
	}

	public void ExitGame()
	{
		Application.Quit ();
	}

	public void RestartGame()
	{
		SceneManager.LoadScene("DevelopmentScene");
	}

	public void ExitMenu()
	{
		SceneManager.LoadScene ("TitleScreen");
	}
}
