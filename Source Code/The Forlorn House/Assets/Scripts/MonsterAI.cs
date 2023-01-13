using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class MonsterAI : MonoBehaviour
{
    public enum MS
    {
        investigating,
        chasing,
        goToLight,
        waiting,
        wandering,
        beginning
    }

    public MS state = MS.beginning;

    public float wanderRadius = 25f;
    public LayerMask wanderLayerMask;

    public float lightTriggerRange = 8f;
    public float lightTriggerRadius = 1f;

    public float playerRangeSmall = 5f;
    public float playerRangeLarge = 10f;
    public LayerMask playerVisionLayerMask;
    public LayerMask chasePlayerLayerMask;
    public float chaseWaitForPlayerTime = 4f;
    float chaseWaitForPlayerTick;

    public float waitTime = 4f;
    public float waitTick;

    float stateBufferTime = 1f;
    float stateBufferTick;

    public float lightActRange = 5f;

    
    public bool debugSeeLight = false;

    public float wanderTime = 8f;

    public int numberOfKeysToActivate = 1;
    public Vector3 beginPos;
    public Vector3 activatePos;

    float wanderTick;


    public Transform raycastTf;

    public Transform targetSwitchTf;
    public NavMeshAgent agent;

    private void Start()
    {
        //agent.enabled = false;
    }

    private void Update()
    {
        switch (state)
        {
            case MS.waiting:
                #region waiting
                if (agent.isStopped == false) agent.isStopped = true;

                SeeLightTrigger();
                if (Physics.CheckSphere(transform.position, playerRangeSmall, chasePlayerLayerMask))
                {
                    LookForPlayerThenChase(playerRangeSmall);
                }
                else if (debugSeeLight)
                {
                    Transform playerTf = GameObject.FindGameObjectWithTag("Player").GetComponent<Transform>();
                    agent.SetDestination(playerTf.position);
                    state = MS.investigating;
                    stateBufferTick = stateBufferTime;
                }


                if (waitTick <= 0)
                {
                    SeeLightTrigger();
                    if (Physics.CheckSphere(transform.position, playerRangeSmall, chasePlayerLayerMask))
                    {
                        LookForPlayerThenChase(playerRangeSmall);
                        #region
                        /*
                        Transform playerTf = GameObject.FindGameObjectWithTag("Player").GetComponent<Transform>();
                        agent.SetDestination(playerTf.position);
                        state = MS.chasing;
                        stateBufferTick = stateBufferTime;*/
                        #endregion
                    }else if (debugSeeLight)
                    {
                        Transform playerTf = GameObject.FindGameObjectWithTag("Player").GetComponent<Transform>();
                        agent.SetDestination(playerTf.position);
                        state = MS.investigating;
                        stateBufferTick = stateBufferTime;
                    }
                    else
                    {
                        targetSwitchTf = GetNearestLightSwitch();
                        if (targetSwitchTf != null)
                        {
                            agent.SetDestination(targetSwitchTf.position);
                            state = MS.goToLight;
                            stateBufferTick = stateBufferTime;
                        }
                        else
                        {
                            agent.SetDestination(RandomNavSphere2(transform.position, wanderRadius));
                            state = MS.wandering;
                            stateBufferTick = stateBufferTime;

                            wanderTick = wanderTime;
                        }
                    }
                }
                else waitTick -= 1 * Time.deltaTime;
                #endregion
                break;

            case MS.wandering:
                #region wandering
                if (agent.isStopped == true) agent.isStopped = false;
                
                if (stateBufferTick <= 0)
                {
                    if (Physics.CheckSphere(transform.position, playerRangeSmall, chasePlayerLayerMask))
                    {
                        LookForPlayerThenChase(playerRangeSmall);
                    }
                    else if(wanderTick <= 0)
                    {
                        waitTick = waitTime;
                        state = MS.waiting;
                        stateBufferTick = stateBufferTime;
                    }
                    else if (hasAgentStoppedMoving())
                    {
                        waitTick = waitTime;
                        state = MS.waiting;
                        stateBufferTick = stateBufferTime;
                    }
                }
                else stateBufferTick -= 1 * Time.deltaTime;

                wanderTick -= 1 * Time.deltaTime;
                #endregion
                break;

            case MS.goToLight:
                #region goToLight
                if (agent.isStopped == true) agent.isStopped = false;
                SeeLightTrigger();
                if(debugSeeLight)
                {
                    Transform playerTf = GameObject.FindGameObjectWithTag("Player").GetComponent<Transform>();
                    agent.SetDestination(playerTf.position);
                    state = MS.investigating;
                    stateBufferTick = stateBufferTime;
                }
                else if (Physics.CheckSphere(transform.position, playerRangeSmall, chasePlayerLayerMask))
                {
                    LookForPlayerThenChase(playerRangeSmall);
                }
                else if (hasAgentStoppedMoving() && stateBufferTick <= 0)
                {
                    LightSwitch lightSwitch = null;
                    if (targetSwitchTf != null) lightSwitch = targetSwitchTf.GetComponent<LightSwitch>();
                    if (lightSwitch != null) if (lightSwitch.isLightOn && Vector3.Distance(transform.position, targetSwitchTf.position) <= lightActRange) lightSwitch.Interact();

                    waitTick = waitTime;
                    state = MS.waiting;
                    stateBufferTick = stateBufferTime;
                }

                stateBufferTick = Mathf.Max(stateBufferTick - 1 * Time.deltaTime, 0);
                #endregion
                break;

            case MS.investigating:
                #region investigating
                if (agent.isStopped == true) agent.isStopped = false;
                SeeLightTrigger();
                if (debugSeeLight)
                {
                    Transform playerTf = GameObject.FindGameObjectWithTag("Player").GetComponent<Transform>();
                    agent.SetDestination(playerTf.position);
                    state = MS.investigating;
                    stateBufferTick = stateBufferTime;
                }
                else if(Physics.CheckSphere(transform.position, playerRangeLarge, chasePlayerLayerMask))
                {
                    LookForPlayerThenChase(playerRangeLarge);
                }
                else if (hasAgentStoppedMoving() && stateBufferTick <= 0)
                {
                    waitTick = waitTime;
                    state = MS.waiting;
                    stateBufferTick = stateBufferTime;
                }

                stateBufferTick = Mathf.Max(stateBufferTick - 1 * Time.deltaTime, 0);
                #endregion
                break;

            case MS.chasing:
                #region investigating
                if (agent.isStopped == true) agent.isStopped = false;
                //RaycastHit hit;
                if(Physics.CheckSphere(transform.position, playerRangeLarge, chasePlayerLayerMask))
                {

                    RaycastHit hit;
                    Transform playerTf = GameObject.FindGameObjectWithTag("Player").GetComponent<Transform>();
                    if (Physics.Raycast(raycastTf.position, Direction(raycastTf.position, playerTf.position), out hit, playerRangeLarge, playerVisionLayerMask))
                    {
                        if (hit.transform.tag == "Player")
                        {
                            agent.SetDestination(playerTf.position);
                        }
                    }
                }
                else
                {
                    chaseWaitForPlayerTick -= 1 * Time.deltaTime;
                    if(agent.destination != transform.position)
                    {
                        agent.SetDestination(transform.position);
                        chaseWaitForPlayerTick = chaseWaitForPlayerTime;
                    }

                    if(chaseWaitForPlayerTick <= 0)
                    {
                        waitTick = waitTime;
                        state = MS.waiting;
                        stateBufferTick = stateBufferTime;
                    }
                }

                stateBufferTick = Mathf.Max(stateBufferTick - 1 * Time.deltaTime, 0);
                #endregion
                break;

            case MS.beginning:
               //if (agent.isStopped == false) agent.isStopped = true;
                agent.Warp(beginPos);
                if (Inventory.instance.numberOfKeys >= numberOfKeysToActivate)
                {
                    state = MS.waiting;
                    stateBufferTick = stateBufferTime;
                    agent.Warp(activatePos);
                }
                break;
        }
        //Debug.Log(transform.position);

        #region Beta AI
        /*
        if (waitTick <= 0)
        {
            SeeLightTrigger();
            if(debugSeeLight)
            {
                Transform playerTf = GameObject.FindGameObjectWithTag("Player").GetComponent<Transform>();
                agent.SetDestination(playerTf.position);
            }else if (Mathf.Abs(agent.velocity.x + agent.velocity.y + agent.velocity.z) < .05)
            {
                Debug.Log("Hold up");
                LightSwitch lightSwitch = null;
                if (targetSwitchTf != null) lightSwitch = targetSwitchTf.GetComponent<LightSwitch>();
                if (lightSwitch != null) if (lightSwitch.isLightOn && Vector3.Distance(transform.position, targetSwitchTf.position) <= 5f) lightSwitch.Interact();
                targetSwitchTf = GetNearestLightSwitch();
                if (targetSwitchTf != null)
                {
                    Debug.Log("Set new destination");
                    agent.SetDestination(targetSwitchTf.position);
                }
            }
        }
        */
        #endregion

    }

    void LookForPlayerThenChase(float raycastRange)
    {
        RaycastHit hit;
        Transform playerTf = GameObject.FindGameObjectWithTag("Player").GetComponent<Transform>();
        if (Physics.Raycast(raycastTf.position, Direction(raycastTf.position, playerTf.position), out hit, raycastRange, playerVisionLayerMask))
        {
            if (hit.transform.tag == "Player")
            {
                agent.SetDestination(playerTf.position);
                state = MS.chasing;
                stateBufferTick = stateBufferTime;
            }

            Debug.Log("I see " + hit.transform.name);
        }
    }

    Vector3 Direction (Vector3 v1, Vector3 v2)
    {
        Vector3 heading = v2 - v1;
        float distance = heading.magnitude;
        Vector3 direction = heading / distance;
        return direction;
    }

    Transform GetNearestLightSwitch()
    {
        bool sucess = false;
        Transform nearestLightSwitchTf;
        Transform nearestLightSwitch;

        GameObject[] goSwitches = GameObject.FindGameObjectsWithTag("Light Switch");
        Transform[] tfSwitches = new Transform[goSwitches.Length];
        for(int i = 0; i < goSwitches.Length; i++)
        {
            tfSwitches[i] = goSwitches[i].transform;
        }

        if (tfSwitches.Length > 0)
        {
            sucess = true;
            nearestLightSwitch = GetClosestEnemy(tfSwitches);
            return nearestLightSwitch;
        }
        else return null;

    }

    void SeeLightTrigger()
    {
        RaycastHit hit;
        if(Physics.SphereCast(raycastTf.position, lightTriggerRadius, raycastTf.forward,out hit, lightTriggerRange))
        {
            Debug.Log("What ThIs I sWEe???");
            if (hit.transform.tag == "Flash Light Trigger") debugSeeLight = true;
            else debugSeeLight = false;
        }else debugSeeLight = false;
    }

    Transform GetClosestEnemy(Transform[] enemies)
    {
        Transform bestTarget = null;
        float closestDistanceSqr = Mathf.Infinity;
        Vector3 currentPosition = transform.position;
        foreach (Transform potentialTarget in enemies)
        {
            Vector3 directionToTarget = potentialTarget.position - currentPosition;
            float dSqrToTarget = directionToTarget.sqrMagnitude;
            if (dSqrToTarget < closestDistanceSqr)
            {
                closestDistanceSqr = dSqrToTarget;
                bestTarget = potentialTarget;
            }
        }

        return bestTarget;
    }

    bool hasAgentStoppedMoving()
    {
        return Mathf.Abs(agent.velocity.x + agent.velocity.y + agent.velocity.z) < .05;
    }

    public static Vector3 RandomNavSphere(Vector3 origin, float distance, int layermask)
    {
        Vector3 randomDirection = UnityEngine.Random.insideUnitSphere * distance;

        randomDirection += origin;

        NavMeshHit navHit;

        NavMesh.SamplePosition(randomDirection, out navHit, distance, layermask);

        Debug.Log(navHit.position);

        return navHit.position;
    }

    public Vector3 RandomNavSphere2(Vector3 origin, float distance)
    {
        Vector3 randomDirection = Random.insideUnitSphere * distance;

        randomDirection += transform.position;
        NavMeshHit hit;
        NavMesh.SamplePosition(randomDirection, out hit, distance, 1);
        Vector3 finalPosition = hit.position;
        return finalPosition;
    }

    private void OnCollisionEnter(Collision collision)
    {
        if(collision.transform.tag == "Player")
        {
            PlayerJumpscare pJumpscare = collision.transform.GetComponent<PlayerJumpscare>();
            if(pJumpscare != null)
            {
                pJumpscare.Jump();
                Destroy(gameObject);
            }
        }
    }

    private void OnDrawGizmos()
    {
        Gizmos.DrawLine(raycastTf.position, raycastTf.position + raycastTf.forward * lightTriggerRange);
        //if(agent.destination != null)Gizmos.DrawWireSphere(agent.destination, 0.5f);
        Gizmos.DrawSphere(agent.destination, 0.5f);
        Transform playerTf = GameObject.FindGameObjectWithTag("Player").GetComponent<Transform>();
        Gizmos.color = Color.yellow;
        //Gizmos.DrawLine(raycastTf.position, Direction(playerTf.position, raycastTf.position));
        Gizmos.DrawRay(raycastTf.position, Direction(raycastTf.position, playerTf.position));
    }
    

}