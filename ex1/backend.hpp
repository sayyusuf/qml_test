#pragma once


#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQmlProperty>

#include <QDebug>


class Backend: public QObject{
    Q_OBJECT
    Q_PROPERTY(QString text READ text WRITE setText NOTIFY textChanged)
public:
    QString text() const;
   void setText(const QString &text);
signals:
    void textChanged(const QString & text);
private:
    QString mText;
};