#version 330

in vec3 a_Position;

uniform float u_Time = 0;
uniform float u_Period = 2.0;

const vec3 c_StartPos = vec3(-1, 0, 0);
const vec3 c_Velocity = vec3(2.0, 0, 0);
const vec3 c_ParaVelocity = vec3(2.0, 2.0, 0); //45도 각도
const vec2 c_2DGravity = vec2(0.0, -4.9);
const float c_PI = 3.141592;

void Basic()
{
	vec4 newPosition = vec4(a_Position,1);
	gl_Position = newPosition;
}

void Line() {
	float newTime = abs(fract(u_Time/u_Period) - 0.5) * 2.0; //중요함 (빈칸문제)
	vec4 newPosition;
	newPosition.xyz = 
	(a_Position + c_StartPos) + 
	c_Velocity * newTime; //시작지점
	newPosition.w = 1;
	gl_Position = newPosition;
}

void Circle() //원
{
	float newTime = fract(u_Time/u_Period) *c_PI*2.0; //중요함 (-fract -> 시계방향 회전)
	vec2 trans = vec2(cos(newTime), sin(newTime));
	vec4 newPosition;
	newPosition.xy = a_Position.xy + trans;
	newPosition.zw = vec2(0,1);
	gl_Position = newPosition;
}

void Parabloa() //포물선
{
	float newTime = fract(u_Time/u_Period);
	float t = newTime;
	float tt = t*t;
	vec4 newPosition;
	float transX = (a_Position.x+ c_StartPos.x)	
					+ c_ParaVelocity.x * newTime
					+ 0.5 * c_2DGravity.x * tt;
	float transY = (a_Position.y+ c_StartPos.y)	
					+ c_ParaVelocity.y * newTime
					+ 0.5 * c_2DGravity.y * tt;
	newPosition.xy = vec2(transX, transY);
	newPosition.zw = vec2(0, 1);
	gl_Position = newPosition;
}

void Triangle() //시험에 나옴 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
{
	float newTimeX = abs(fract(u_Time/u_Period) -0.5);
	float newTimeY = 0.5-abs(max(fract(u_Time/u_Period) -0.5,0)*2 -0.5);
	vec4 newPosition;
	newPosition.x = (c_StartPos.x + a_Position.x)+2 * newTimeX;
	newPosition.y = (c_StartPos.y + a_Position.y)+2 * newTimeY;
	newPosition.w = 1;
	gl_Position = newPosition;
}


void main()
{
	//Line();
	//Circle();
	//Parabloa();
	//Basic();
	Triangle();
}
