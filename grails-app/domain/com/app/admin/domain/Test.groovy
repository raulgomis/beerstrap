package com.app.admin.domain

/**
 * grailsbs
 * @autor raulgomis
 * Date: 22/11/13 | Time: 20:03
 */
class Test {
    String name
    String surname

    Date dateBirth

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("Test{");
        sb.append("name='").append(name).append('\'');
        sb.append(", surname='").append(surname).append('\'');
        sb.append('}');
        return sb.toString();
    }
}
