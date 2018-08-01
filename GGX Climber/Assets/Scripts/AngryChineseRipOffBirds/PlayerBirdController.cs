using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerBirdController : MonoBehaviour {
	Rigidbody rb;
	Vector3 mouseDownPosition;
	Vector3 mouseUpPosition;
	float dragginPower;
	Vector3 direction;
	public int maxForce = 20;
	// Use this for initialization
	void Start () {
		rb = GetComponent<Rigidbody> ();
	}
	
	// Update is called once per frame
	void Update () {
		
	}

	void OnMouseDown()
	{
		mouseDownPosition = Input.mousePosition;
		Debug.Log ("The mouse position is " + mouseDownPosition.y.ToString());
		Debug.Log ("The mouse position is " + mouseDownPosition.x.ToString());
		mouseDownPosition.z = 0;
	}

	void OnMouseDrag(){
		// Debug.Log ("Im Dragging");
		mouseUpPosition = Input.mousePosition;
		float powerX = mouseDownPosition.x - mouseUpPosition.x;
		float powerY = mouseDownPosition.y - mouseUpPosition.y;
		dragginPower = (powerX + powerY) / 9.8f;
		if (dragginPower >= maxForce) {
			dragginPower = maxForce;
		}
	}

	void OnMouseUp(){
		mouseUpPosition = Input.mousePosition;	
		Debug.Log ("The mouse position is " + mouseUpPosition.y.ToString());
		Debug.Log ("The mouse position is " + mouseUpPosition.x.ToString());
		Debug.Log ("The mouse power is " + dragginPower.ToString());
		mouseUpPosition.z = 0;
		direction = mouseDownPosition - mouseUpPosition;
		direction.Normalize ();
		rb.AddForce (direction * dragginPower, ForceMode.Impulse);
		Debug.Log ("I let go" + direction.ToString());
	}
}
