terraform {
  required_providers {
    aci = {
      source = "ciscodevnet/aci"
    }
  }
}
provider "aci" {
  username = "admin"
  password = "!v3G@!4@Y"
  url      = "https://sandboxapicdc.cisco.com/"
  insecure = true
}


resource "aci_tenant" "tenant" {
  name        = var.tenant
  description = "from terraform"
  annotation  = var.tenant
}

resource "aci_application_profile" "app" {
  tenant_dn   = aci_tenant.tenant.id
  name        = var.app
  annotation  = var.app
  description = "from terraform"
  name_alias  = var.app
  prio        = "level1"
}

resource "aci_application_epg" "epgs" {
  for_each               = toset(var.epglist)
  application_profile_dn = aci_application_profile.app.id
  name                   = each.value
  description            = "from terraform"
  annotation             = each.value
  exception_tag          = "0"
  flood_on_encap         = "disabled"
  fwd_ctrl               = "none"
  has_mcast_source       = "no"
  is_attr_based_epg      = "no"
  match_t                = "AtleastOne"
  name_alias             = each.value
  pc_enf_pref            = "unenforced"
  pref_gr_memb           = "exclude"
  prio                   = "unspecified"
  shutdown               = "no"
}

