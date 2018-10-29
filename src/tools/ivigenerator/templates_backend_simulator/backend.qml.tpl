{#
# Copyright (C) 2018 Pelagicore AG
# Contact: https://www.qt.io/licensing/
#
# This file is part of the QtIvi module of the Qt Toolkit.
#
# $QT_BEGIN_LICENSE:LGPL-QTAS$
# Commercial License Usage
# Licensees holding valid commercial Qt Automotive Suite licenses may use
# this file in accordance with the commercial license agreement provided
# with the Software or, alternatively, in accordance with the terms
# contained in a written agreement between you and The Qt Company.  For
# licensing terms and conditions see https://www.qt.io/terms-conditions.
# For further information use the contact form at https://www.qt.io/contact-us.
#
# GNU Lesser General Public License Usage
# Alternatively, this file may be used under the terms of the GNU Lesser
# General Public License version 3 as published by the Free Software
# Foundation and appearing in the file LICENSE.LGPL3 included in the
# packaging of this file. Please review the following information to
# ensure the GNU Lesser General Public License version 3 requirements
# will be met: https://www.gnu.org/licenses/lgpl-3.0.html.
#
# GNU General Public License Usage
# Alternatively, this file may be used under the terms of the GNU
# General Public License version 2.0 or (at your option) the GNU General
# Public license version 3 or any later version approved by the KDE Free
# Qt Foundation. The licenses are as published by the Free Software
# Foundation and appearing in the file LICENSE.GPL2 and LICENSE.GPL3
# included in the packaging of this file. Please review the following
# information to ensure the GNU General Public License requirements will
# be met: https://www.gnu.org/licenses/gpl-2.0.html and
# https://www.gnu.org/licenses/gpl-3.0.html.
#
# $QT_END_LICENSE$
#
# SPDX-License-Identifier: LGPL-3.0
#}

import QtQuick 2.0
import {{module.name|lower}}.simulation 1.0

{% set interface_zoned = interface.tags.config and interface.tags.config.zoned %}

QtObject {
    property var settings : IviSimulator.findData(IviSimulator.simulationData, "{{interface}}")
    property bool defaultInitialized: false
    property var backend : {{interface|upperfirst}}Backend {

        function initialize() {
            print("{{interface}}Simulation INITIALIZE")
            if (!defaultInitialized) {
                IviSimulator.initializeDefault(settings, backend)
                defaultInitialized = true
            }
            Base.initialize()
        }

{% if interface_zoned %}
        function availableZones() {
            return settings.zones;
        }
{% endif %}

{% for property in interface.properties %}
        function {{property|setter_name}}({{property}}) {
            if (IviSimulator.checkSettings({{property}}, settings["{{property}}"])) {
                console.log("SIMULATION {{ property }} changed to: " + {{property}});
                backend.{{property}} = {{property}}
            } else {
                setError("SIMULATION changing {{property}} is not possible: provided: " + {{property}} + "constraint: " + IviSimulator.constraint_string(settings["{{property}}"]));
            }
        }
{% endfor %}
    }
}