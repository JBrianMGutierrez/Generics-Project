using System.Collections;
using System.Collections.Generic;
using UnityEngine;

using UnityEngine.Events;

public class eventtest : MonoBehaviour {

	public UnityEvent ebento;

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		if (Input.GetKey (KeyCode.P)) {
			ebento.Invoke ();
		}
	}
}
