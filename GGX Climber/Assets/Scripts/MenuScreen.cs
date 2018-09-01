using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class MenuScreen : MonoBehaviour
{
    public GameObject diedScreen;
	public GameObject menuScreen;

	void Update()
	{
		if (Input.GetKeyDown (KeyCode.P)) {
			ToogleMenu ();
		}
	}

	public void DiedToogleScreen()
	{
        diedScreen.SetActive(true);
        Time.timeScale = 0;
    }

	public void ToogleMenu()
	{
        menuScreen.SetActive(!menuScreen.activeInHierarchy);
    }
}
