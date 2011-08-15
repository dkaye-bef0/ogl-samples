#version 420 core

#define POSITION	0
#define COLOR		3
#define FRAG_COLOR	0

layout(triangle_strip, max_vertices = 3) out;
precision highp float;

in gl_PerVertex
{
	vec4 gl_Position;
} gl_in[];

in block
{
	vec4 Color;
} In[];

out block
{
	layout(stream = 0) vec4 Color;
} Out;

out gl_PerVertex
{
	vec4 gl_Position;
} gl_Out;

void main()
{
	for(int i = 0; i < gl_in.length(); ++i)
	{
		Out.Color = In[i].Color;
		gl_Position = gl_in[i].gl_Position;
		EmitVertex();
	}
	EndPrimitive();
}
