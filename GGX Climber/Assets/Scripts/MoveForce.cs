using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MoveForce : MonoBehaviour 
{
	public Vector3 forcePower;
	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}
	void OnTriggerStay(Collider objects)
	{
		objects.gameObject.GetComponent<Rigidbody> ().AddForce (forcePower, ForceMode.Force);
	}
}
