package org.strotmann.purchase

import org.strotmann.partner.adapter.Partner

class Bestellung {

    BigDecimal wert
	Date date 
		
    static constraints = {
		
		wert()
		date()
		
    }
	
	String getSupplierName() {
		Partner.getPartner('Lieferant','Purchase:Bestellung',id)
	}
	
	long getPartnerId() {
		if (id)
			Partner.getPartner('Lieferant','Purchase:Bestellung',id).id
		else
			0
	}
	
	String getPartnerArt() {
		Partner.getPartner('Lieferant','Purchase:Bestellung',id).pArt
	}
	
	String getPartnerUri() {
		Partner.partnerUri
	}
	
	Boolean saveSupplierRole(long partnerId, long oldId) {
		Partner.savePartnerrolle(partnerId, oldId, "Lieferant", "Purchase:Bestellung", id)
	}
	
	Boolean loginPartner() {
		//vorläufig hart codiert, da diese Anwendung noch kein Anmeldebild hat
		Partner.appUserLogin('peter', 'wuffwuff')
	}
	
	void deleteSupplierRole() {
		Partner.loePartnerrolle('Lieferant','Purchase:Bestellung',id)
	}
	
	void saveRueckUri(String uri) {
		Partner.saveRueckUri('Purchase:Bestellung',uri)
	}
}
