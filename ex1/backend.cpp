
#include "backend.hpp"

    QString Backend::text() const{
        qDebug() << "okudu";
        return mText;
    }
   void Backend::setText(const QString &text){
    qDebug() << "yazdi";
        if(text == mText)
            return;
        mText = text;
        emit textChanged(mText);
    }
