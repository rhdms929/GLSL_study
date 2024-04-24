#version 330

layout(location=0) out vec4 FragColor;

uniform sampler2D u_Texture;

in vec2 v_TexPos;

void P1()
{
	vec2 newTexPos;
	float tx = v_TexPos.x;
	float ty = fract(v_TexPos.y *2);
	newTexPos = vec2(tx, ty);

	FragColor = texture(u_Texture, newTexPos);
}

void P2()
{
	vec2 newTexPos;
	float tx = v_TexPos.x;
	float ty = 1-abs(v_TexPos.y*2 - 1); // 1에서 빼면 뒤집음 뭔가 시험에 나올듯?
	newTexPos = vec2(tx, ty);

	FragColor = texture(u_Texture, newTexPos);
}

void main()
{
	//P1();
	P2();
}

