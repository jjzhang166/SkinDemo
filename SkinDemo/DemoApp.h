#pragma once

#include "DemoBase.h"

class ShadowMap;
class AABB;

class DemoApp :
	public DemoBase
{
public:
	DemoApp(HINSTANCE hInstance);
	~DemoApp();

	bool Init();
	void OnResize();
	void UpdateScene(float dt);
	void DrawScene();

	void OnMouseDown(WPARAM btnState, int x, int y);
	void OnMouseUp(WPARAM btnState, int x, int y);
	void OnMouseMove(WPARAM btnState, int x, int y);

private:

	//Common setups
	void CreateGeometry();
	void CreateShaders();
	void CreateContantBuffers();
	void CreateRenderStates();
	void CreateSamplerStates();
	void SetUpSceneConsts();
	void CreateLights();

	//Shadow Map
	void RenderShadowMap();
	void BuildShadowMapMatrices();

private:

	ID3D11VertexShader * m_pVertexShader;
	ID3D11PixelShader * m_pPixelShader;
	ID3D11VertexShader * m_pShadowMapVS;
	ID3D11PixelShader * m_pShadowMapPS;


	ID3D11Buffer * m_pCBNeverChanges;
	ID3D11Buffer * m_pCBOnResize;
	ID3D11Buffer * m_pCBPerFrame;
	ID3D11Buffer * m_pCBPerObject;
	ID3D11Buffer * m_pCBPerObjShadow;

	ID3D11Buffer * m_pVertexBuffer;
	ID3D11Buffer * m_pIndexBuffer;
	UINT numVertex;
	UINT numTriangle;

	ID3D11ShaderResourceView * m_pTextureSRV;
	ID3D11SamplerState * m_pSampleLinear;
	ID3D11ShaderResourceView * m_pNormalMapSRV;

	ShadowMap *m_pShadowMap;
	int  mShadowMapSize = 4096;
	XMMATRIX mLightVPT;
	XMMATRIX mLightView;
	XMMATRIX mLightProj;
	XMMATRIX mLightViewport;

	XMMATRIX m_World;
	XMMATRIX m_View;
	XMMATRIX m_Proj;

	POINT mLastMousePos;
	float mTheta;
	float mPhi;
	float mRadius;

	DirectionalLight mDirLight;
	PointLight mPointLight;

	AABB *m_pAABB;
};

