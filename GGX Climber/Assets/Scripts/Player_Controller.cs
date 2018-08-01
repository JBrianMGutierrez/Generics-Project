using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Player_Controller : MonoBehaviour {
	
	Rigidbody rb;
	Recovery stand;
	public Animator anim;
	[HideInInspector] public CapsuleCollider cc;
	[HideInInspector] public bool isDead = false;
	[HideInInspector] public bool isGrounded = false;

    public float rotationSpeed;
	public float resistance = 10;
	public float jumpHeight = 5;
	public float forwardSpeed = 5;


	// Use this for initialization
	void Start ()
	{
		rb = GetComponent<Rigidbody>();
		cc = GetComponent<CapsuleCollider>();
		stand = GetComponent<Recovery>();
	}

	// Update is called once per frame
	void Update () 
	{
		if (!isDead)
		{
			if (Input.GetButtonDown("Jump") && isGrounded)
			{
				Jump();
			}
			if (Input.GetKey(KeyCode.W) || Input.GetKey(KeyCode.S))
			{
				rb.AddForce(new Vector3(transform.forward.x, 0, transform.forward.z) * forwardSpeed);
			}
			if(Input.GetKey(KeyCode.D))
			{        
				transform.Rotate(new Vector3(-rotationSpeed, 0, 0));
			}
			if(Input.GetKey(KeyCode.A))
			{
				transform.Rotate(new Vector3(rotationSpeed, 0, 0));
			}
		}
    }

    void OnCollisionEnter(Collision col)
	{
        isGrounded = true;
		if (col.relativeVelocity.magnitude > resistance)
		{
			cc.enabled = false;
            isDead = true;
			rb.constraints = RigidbodyConstraints.None;
			anim.SetBool("Stun", true);
			stand.StandUp();
		}
	}

	void Jump()
	{
        if(!isDead)
        {
            rb.AddForce(new Vector3(0, jumpHeight * 100, 0), ForceMode.Impulse);
            isGrounded = false;
        }
	}
}
