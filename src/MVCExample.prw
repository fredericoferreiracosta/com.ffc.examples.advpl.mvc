#include "protheus.ch"
#include "fwmvcdef.ch"

#define FILENAME "MVCExample"
#define VIEW_LOCATION "VIEWDEF." + FILENAME
#define TABLE "SB1"
#define MODEL_ID "IDMODEL001"
#define MODEL_FORM_ID "IDFORM001"
#define VIEW_FORM_ID "IDFORMVIEW001"

/*/{Protheus.doc} MVCExample
This is a very basic example on how to use TOTVS MVC Framework
using SB1 TABLE (products).
The name of this file should be MVCExample.prw. This matters.
/*/
User Function MVCExample

    Local oBrowse := FWMBrowse():New()

    oBrowse:SetAlias(TABLE)
    oBrowse:SetDescription("List title - Products")

    oBrowse:Activate()

Return

Static Function MenuDef()

    Local aMenu := {}

    AAdd(aMenu, {"View", VIEW_LOCATION, 0, 2, 0, NIL})
    AAdd(aMenu, {"Insert", VIEW_LOCATION, 0, 3, 0, NIL})
    AAdd(aMenu, {"Change", VIEW_LOCATION, 0, 4, 0, NIL})
    AAdd(aMenu, {"Delete", VIEW_LOCATION, 0, 5, 0, NIL})

Return aMenu

Static Function ModelDef

    Local oProductStruc := FWFormStruct(1, TABLE)
    Local oModel := MPFormModel():New(MODEL_ID)

    oModel:AddFields(MODEL_FORM_ID, /*cOwner*/, oProductStruc)
    oModel:SetDescription("Details title - Product")

Return oModel

Static Function ViewDef

    Local oProductStruc := FWFormStruct(2, TABLE)
    Local oView := FWFormView():New()
    Local oModel := FWLoadModel(FILENAME)

    oView:SetModel(oModel)
    oView:AddField(VIEW_FORM_ID, oProductStruc, MODEL_FORM_ID)

    oView:CreateHorizontalBox("WINDOW" , 100)
    oView:SetOwnerView(VIEW_FORM_ID, "WINDOW")

Return oView
