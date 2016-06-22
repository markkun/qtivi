/****************************************************************************
**
** Copyright (C) 2016 Pelagicore AG
** Contact: https://www.qt.io/licensing/
**
** This file is part of the QtIVI module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL-QTAS$
** Commercial License Usage
** Licensees holding valid commercial Qt Automotive Suite licenses may use
** this file in accordance with the commercial license agreement provided
** with the Software or, alternatively, in accordance with the terms
** contained in a written agreement between you and The Qt Company.  For
** licensing terms and conditions see https://www.qt.io/terms-conditions.
** For further information use the contact form at https://www.qt.io/contact-us.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 3 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPL3 included in the
** packaging of this file. Please review the following information to
** ensure the GNU Lesser General Public License version 3 requirements
** will be met: https://www.gnu.org/licenses/lgpl-3.0.html.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 2.0 or (at your option) the GNU General
** Public license version 3 or any later version approved by the KDE Free
** Qt Foundation. The licenses are as published by the Free Software
** Foundation and appearing in the file LICENSE.GPL2 and LICENSE.GPL3
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-2.0.html and
** https://www.gnu.org/licenses/gpl-3.0.html.
**
** $QT_END_LICENSE$
**
** SPDX-License-Identifier: LGPL-3.0
**
****************************************************************************/

#ifndef QIVIAMFMTUNER_H
#define QIVIAMFMTUNER_H

#include <QtIviCore/QIviAbstractFeature>
#include <QtIviMedia/qtivimediaglobal.h>
#include <QVariant>

QT_BEGIN_NAMESPACE

class QIviAmFmTunerPrivate;

static const QLatin1String QIviStringAmFmTunerInterfaceName("com.qt-project.qtivi.AmFmTuner");

class Q_QTIVIMEDIA_EXPORT QIviAmFmTuner : public QIviAbstractFeature
{
    Q_OBJECT

    Q_PROPERTY(int frequency READ frequency WRITE setFrequency NOTIFY frequencyChanged)
    Q_PROPERTY(QIviAmFmTuner::Band band READ band WRITE setBand NOTIFY bandChanged)
    Q_PROPERTY(QVariant station READ station NOTIFY stationChanged)

public:
    explicit QIviAmFmTuner(QObject *parent = Q_NULLPTR);

    enum Band {
        AMBand,
        FMBand
    };
    Q_ENUM(Band)


    int frequency() const;
    Band band() const;
    QVariant station() const;

    Q_INVOKABLE void tune(const QVariant &station);

public Q_SLOTS:
    void setFrequency(int frequency);
    void setBand(QIviAmFmTuner::Band band);
    void stepUp();
    void stepDown();
    void seekUp();
    void seekDown();

Q_SIGNALS:
    void frequencyChanged(int frequency);
    void bandChanged(QIviAmFmTuner::Band band);
    void stationChanged(const QVariant &station);

protected:
    QIviAmFmTuner(QIviAmFmTunerPrivate &dd, QObject *parent = Q_NULLPTR);

    virtual bool acceptServiceObject(QIviServiceObject *serviceObject) Q_DECL_OVERRIDE;
    virtual void connectToServiceObject(QIviServiceObject *serviceObject) Q_DECL_OVERRIDE;
    virtual void disconnectFromServiceObject(QIviServiceObject *serviceObject) Q_DECL_OVERRIDE;
    virtual void clearServiceObject() Q_DECL_OVERRIDE;

private:
    Q_DECLARE_PRIVATE(QIviAmFmTuner)
    Q_PRIVATE_SLOT(d_func(), void onFrequencyChanged(int frequency))
    Q_PRIVATE_SLOT(d_func(), void onBandChanged(QIviAmFmTuner::Band band))
    Q_PRIVATE_SLOT(d_func(), void onStationChanged(const QVariant &station))
};

QT_END_NAMESPACE

#endif // QIVIAMFMTUNER_H