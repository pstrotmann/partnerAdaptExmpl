package org.strotmann.vertragsdienst
import org.strotmann.partner.adapter.*

class Versicherungsvertrag {

    String sparte
	Date beginn
	Date ablauf
	String zahlungsart
	
	SortedSet vertragsstaende
	static hasMany = [vertragsstaende:Vertragsstand]
	
	static constraints = {
		sparte (inList:["Leben", "Kranken", "Unfall", "Kraftfahrt", "Sach"])
		zahlungsart (inList:["Lastschrift", "Überweisung", "Vertreterinkasso"])
    	beginn()
		ablauf(nullable:true)
	}
	
	String toString() {"${id}:${sparte}" }
	
	String getVersicherungsnehmerName() {
		Partner.getPartner('Versicherungsnehmer','Vertragsdienst:Vertrag',id)
	}
	
	long getPartnerId() {
		if (id)
			Partner.getPartner('Versicherungsnehmer','Vertragsdienst:Vertrag',id).id
		else
			0
	}
	
	String getPartnerArt() {
		Partner.getPartner('Versicherungsnehmer','Vertragsdienst:Vertrag',id).pArt
	}
	
	String getPartnerUri() {
		Partner.partnerUri
	}
	
	Boolean saveVersicherungsnehmerRole(long partnerId, long oldId) {
		Partner.savePartnerrolle(partnerId, oldId, "Versicherungsnehmer", "Vertragsdienst:Vertrag", id)
		}
	
	void deleteVersicherungsnehmerRole() {
		Partner.loePartnerrolle('Versicherungsnehmer','Vertragsdienst:Vertrag',id)
	}
	
	void saveRueckUri(String uri) {
		Partner.saveRueckUri('Vertragsdienst:Vertrag',uri)
	}
	
	Boolean loginPartner() {
		//vorläufig hart codiert, da diese Anwendung noch kein Anmeldebild hat
		Partner.appUserLogin('userDe', 'wauwau')
	}
}
