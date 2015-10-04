package org.strotmann.vertragsdienst

class Vertragsstand implements Comparable {

	Date gueltigAb
	BigDecimal beitrag
	String zahlungsweise
	
	static belongsTo = [versicherungsvertrag:Versicherungsvertrag]
	
	String toString() {"${id}:${gueltigAb?gueltigAb.getDateString():''}" }
    
	static constraints = {
		gueltigAb()
		beitrag()
		zahlungsweise (inList:["monatlich", "vierteljährlich", "halbjährlich", "jährlich", "Einmalbeitrag"])
    }
	
	int compareTo(obj) {
		return (id.compareTo(obj.id))
	}
}
