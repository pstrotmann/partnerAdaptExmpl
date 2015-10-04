package org.strotmann.sale

import org.strotmann.partner.adapter.Partner

class Auftrag {
	
	
	BigDecimal wert
	Date date 
		
    static constraints = {
		
		wert()
		date()
		
    }
	
	String getCustomerName() {
		Partner.getPartner('Kunde','Sale:Auftrag',id)
	}
	
	long getPartnerId() {
		if (id)
			Partner.getPartner('Kunde','Sale:Auftrag',id).id
		else
			0
	}
	
	String getPartnerArt() {
		Partner.getPartner('Kunde','Sale:Auftrag',id).pArt
	}
	
	String getPartnerUri() {
		Partner.partnerUri
	}
	
	Boolean saveCustomerRole(long partnerId, long oldId) {
		Partner.savePartnerrolle(partnerId, oldId, "Kunde", "Sale:Auftrag", id)
	}
	
	void deleteCustomerRole() {
		Partner.loePartnerrolle('Kunde','Sale:Auftrag',id)
	}
	
	void saveRueckUri(String uri) {
		Partner.saveRueckUri('Sale:Auftrag',uri)
	}
	
	Boolean loginPartner() {
		//vorläufig hart codiert, da diese Anwendung noch kein Anmeldebild hat
		Partner.appUserLogin('userEn', 'howhow')
	}
}
