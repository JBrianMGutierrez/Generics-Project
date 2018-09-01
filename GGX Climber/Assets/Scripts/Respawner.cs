using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class Respawner : MonoBehaviour
{
	Rigidbody rb;
	Recovery stand;
	public Animator anim;
	public float resistance = 10;
    public int fallCount = 0;
	[HideInInspector] public CapsuleCollider cc;
	[HideInInspector] public bool isDead = false;
	[HideInInspector] public bool isGrounded = false;
	public UnityEvent menuScreen;
	// Use this for initialization
	void Start ()
	{
		rb = GetComponent<Rigidbody>();
		cc = GetComponent<CapsuleCollider>();
		stand = GetComponent<Recovery>();
	}
	
	// Update is called once per frame
	void Update () {

	}

	void OnCollisionEnter(Collision col)
	{
		isGrounded = true;
		if (col.gameObject.tag == "Lava")
		{
			Status ();
			menuScreen.Invoke();
		}
		if (col.relativeVelocity.magnitude > resistance && col.gameObject.tag != "Lava")
		{
            if (fallCount >= 3)
            {
                Status();
                menuScreen.Invoke();
            }
            else
            {
                Status();
                stand.StandUp();
                fallCount++;
            }
		}
	}

	void Status ()
	{
		cc.enabled = false;
		isDead = true;
		rb.constraints = RigidbodyConstraints.None;
		anim.SetBool("Stun", true);
	}
}
