  //{%MainUnit sdl3.pas}

//    {$include common_glib.inc}



{$include gio/giotypes.inc}
{$include gio/gioenums.inc}                // io.
{$include gio/gioenumtypes.inc}            // io.
{$include gio/gaction.inc}                 // io.
{$include gio/gactionmap.inc}              // io. -> gaction
{$include gio/gsimpleactiongroup.inc}      // io. -> gaction, gactionmap
{$include gio/giomodule.inc}               // io.
{$include gio/gsimpleasyncresult.inc}      // io.
{$include gio/gactiongroup.inc}            // io.
{$include gio/gactiongroupexporter.inc}    // io. -> gactiongroup
{$include gio/gicon.inc}                   // io.
{$include gio/gcharsetconverter.inc}       // io.
{$include gio/gcontenttype.inc}            // io.
{$include gio/gdbuserror.inc}              // io.
{$include gio/gdbusobjectmanager.inc}      // io.
{$include gio/gdbusmenumodel.inc}          // io.
{$include gio/gcredentials.inc}            // io.
{$include gio/gdbusobject.inc}             // io.
{$include gio/gfilenamecompleter.inc}      // io.
{$include gio/gmemorymonitor.inc}          // io.
{$include gio/gdbusutils.inc}              // io.
{$include gio/gfileicon.inc}               // io.
{$include gio/gsrvtarget.inc}              // io.
{$include gio/gtlsfiledatabase.inc}        // io.
{$include gio/gdbusactiongroup.inc}        // io.
{$include gio/ginitable.inc}               // io.
{$include gio/gnetworkaddress.inc}         // io.
{$include gio/gsimpleaction.inc}           // io.
{$include gio/gproxyresolver.inc}          // io.
{$include gio/gdtlsclientconnection.inc}   // io.
{$include gio/gemblem.inc}                 // io.
{$include gio/gemblemedicon.inc}           // io. -> gemblem
{$include gio/glistmodel.inc}              // io.
{$include gio/gnetworkservice.inc}         // io.
{$include gio/gseekable.inc}               // io.
{$include gio/gnetworkmonitor.inc}         // io.
{$include gio/gzlibdecompressor.inc}       // io.
{$include gio/gzlibcompressor.inc}         // io.
{$include gio/gpollableinputstream.inc}    // io.
{$include gio/gthemedicon.inc}             // io.
{$include gio/gdebugcontroller.inc}        // io.
{$include gio/gtlscertificate.inc}         // io.
{$include gio/gdtlsserverconnection.inc}   // io. -> gtlscertificate
{$include gio/gdebugcontrollerdbus.inc}    // io.
{$include gio/gioscheduler.inc}            // io.
{$include gio/gpropertyaction.inc}         // io.
{$include gio/gpowerprofilemonitor.inc}    // io.
{$include gio/gtestdbus.inc}               // io.
{$include gio/gsimpleproxyresolver.inc}    // io.
{$include gio/gtlsbackend.inc}             // io.
{$include gio/gdbusnamewatching.inc}       // io.
{$include gio/gpollableoutputstream.inc}   // io.
{$include gio/gdbusnameowning.inc}         // io.
{$include gio/gliststore.inc}              // io.
{$include gio/gdatagrambased.inc}          // io.
{$include gio/gasyncinitable.inc}          // io.
{$include gio/gasyncresult.inc}            // io.
{$include gio/gcancellable.inc}            // io. -> gclosure
{$include gio/gsocketaddress.inc}          // io.
{$include gio/gnativesocketaddress.inc}    // io. -> gsocketaddress
{$include gio/gunixsocketaddress.inc}      // io. -> gsocketaddress
{$include gio/gsocketcontrolmessage.inc}   // io.
{$include gio/gunixcredentialsmessage.inc} // io. -> gsocketcontrolmessage
{$include gio/gdbusobjectproxy.inc}        // io.
{$include gio/gdbusintrospection.inc}      // io.
{$include gio/gdbusinterface.inc}          // io. -> gdbusintrospection
{$include gio/gunixfdlist.inc}             // io.
{$include gio/gdbusmessage.inc}            // io. -> gunixfdlist
{$include gio/gdbusproxy.inc}              // io. -> gdbusintrospection, gunixfdlist
{$include gio/gdbusobjectmanagerclient.inc}// io. -> gdbusobjectproxy, gdbusproxy
{$include gio/gdbusmethodinvocation.inc}   // io. -> gunixfdlist, gdbusintrospection
{$include gio/gioerror.inc}                // io.
{$include gio/gremoteactiongroup.inc}      // io.
{$include gio/gsocketaddressenumerator.inc}// io.
{$include gio/gsocketconnectable.inc}      // io. -> gsocketaddressenumerator
{$include gio/gproxyaddressenumerator.inc} // io. -> gsocketaddressenumerator
{$include gio/gbytesicon.inc}              // io.
{$include gio/gappinfo.inc}                // io.
{$include gio/gsettingsschema.inc}         // io.
{$include gio/gpermission.inc}             // io.
{$include gio/gsettingsbackend.inc}        // io. -> gpermission
{$include gio/gsimplepermission.inc}       // io. -> gpermission
{$include gio/gsettings.inc}               // io. -> gsettingsschema, gaction, gsettingsbackend
{$include gio/gtask.inc}                   // io.
{$include gio/gfileinfo.inc}               // io.
{$include gio/gfileenumerator.inc}         // io.
{$include gio/gfileattribute.inc}          // io.
{$include gio/gvfs.inc}                    // io. -> gfileattribute
{$include gio/gmountoperation.inc}         // io.
{$include gio/gdrive.inc}                  // io. -> gmountoperation
{$include gio/gvolume.inc}                 // io. -> gmountoperation
{$include gio/gvolumemonitor.inc}          // io.
{$include gio/gnativevolumemonitor.inc}    // io. -> gvolumemonitor
{$include gio/gmount.inc}                  // io. -> gvolume, gmountoperation
{$include gio/gfilemonitor.inc}            // io.
{$include gio/ginputstream.inc}            // io.
{$include gio/gloadableicon.inc}           // io. -> ginputstream
{$include gio/gmemoryinputstream.inc}      // io. -> ginputstream
{$include gio/gresource.inc}               // io. -> ginputstream
{$include gio/goutputstream.inc}           // io. -> ginputstream
{$include gio/gfilteroutputstream.inc}     // io. -> goutputstream
{$include gio/gmemoryoutputstream.inc}     // io. -> goutputstream
{$include gio/gsubprocess.inc}             // io. -> goutputstream, ginputstream
{$include gio/gsubprocesslauncher.inc}     // io. -> gsubprocess
{$include gio/gdataoutputstream.inc}       // io. -> gfilteroutputstream, goutputstream
{$include gio/gfileinputstream.inc}        // io. -> ginputstream
{$include gio/gfilterinputstream.inc}      // io. -> ginputstream
{$include gio/giostream.inc}               // io. -> ginputstream, goutputstream
{$include gio/gbufferedinputstream.inc}    // io. -> gfilterinputstream, ginputstream
{$include gio/gbufferedoutputstream.inc}   // io. -> gfilteroutputstream, goutputstream
{$include gio/gdatainputstream.inc}        // io. -> gbufferedinputstream, ginputstream
{$include gio/gsocketconnection.inc}       // io. -> giostream
{$include gio/gunixconnection.inc}         // io. -> gsocketconnection
{$include gio/gsocketlistener.inc}         // io. -> gsocketconnection
{$include gio/gtlsclientconnection.inc}    // io. -> giostream
{$include gio/gsocketclient.inc}           // io. -> giostream, gsocketconnection
{$include gio/gapplicationcommandline.inc} // io. -> ginputstream
{$include gio/gsocketservice.inc}          // io. -> gsocketlistener, gsocketconnection
{$include gio/gthreadedsocketservice.inc}  // io. -> gsocketservice, gsocketconnection
{$include gio/gconverter.inc}              // io.
{$include gio/gconverteroutputstream.inc}  // io. -> gfilteroutputstream, goutputstream, gconverter
{$include gio/gconverterinputstream.inc}   // io. -> gfilterinputstream, ginputstream
{$include gio/gtcpconnection.inc}          // io. -> giostream, gsocketconnection
{$include gio/gtcpwrapperconnection.inc}   // io. -> gtcpconnection, gsocketconnection
{$include gio/gsimpleiostream.inc}         // io. -> ginputstream, goutputstream, giostream
{$include gio/ginetaddress.inc}            // io.
{$include gio/ginetaddressmask.inc}        // io. -> ginetaddress
{$include gio/gsocket.inc}                 // io. -> ginetaddress
{$include gio/gresolver.inc}               // io. -> ginetaddress
{$include gio/ginetsocketaddress.inc}      // io. -> ginetaddress, gsocketaddress
{$include gio/gproxyaddress.inc}           // io. -> ginetsocketaddress, ginetaddress
{$include gio/gproxy.inc}                  // io. -> giostream, gproxyaddress
{$include gio/gnotification.inc}           // io.
{$include gio/gpollableutils.inc}          // io. -> ginputstream, goutputstream
{$include gio/gapplication.inc}            // io. -> gapplicationcommandline, gactiongroup, gnotification
{$include gio/gfileiostream.inc}           // io. -> giostream
{$include gio/gdbusauthobserver.inc}       // io. -> giostream
{$include gio/gdbusaddress.inc}            // io. -> giostream
{$include gio/gfileoutputstream.inc}       // io. -> goutputstream
{$include gio/gfile.inc}                   // io. -> gfileenumerator, gfileattribute, gfileinputstream, gfileoutputstream, gfilemonitor, gmountoperation, gfileiostream
{$include gio/gdbusconnection.inc}         // io. -> giostream, gunixfdlist, gdbusintrospection
{$include gio/gdbusinterfaceskeleton.inc}  // io. -> gdbusintrospection, gdbusconnection
{$include gio/gdbusobjectskeleton.inc}     // io. -> gdbusinterfaceskeleton
{$include gio/gdbusobjectmanagerserver.inc}// io. -> gdbusconnection, gdbusobjectskeleton
{$include gio/gtlsdatabase.inc}            // io. -> gtlscertificate
{$include gio/gtlsconnection.inc}          // io. -> gtlscertificate
{$include gio/gdtlsconnection.inc}         // io. -> gtlscertificate
{$include gio/gdbusserver.inc}             // io. -> gtlscertificate
{$include gio/gtlsserverconnection.inc}    // io. -> giostream, gtlscertificate
{$include gio/gtlspassword.inc}            // io.
{$include gio/gtlsinteraction.inc}         // io. -> gtlsconnection, gtlspassword
{$include gio/gmenumodel.inc}              // io.
{$include gio/gmenu.inc}                   // io. -> gmenumodel
{$include gio/gmenuexporter.inc}           // io. -> gmenumodel


//{$include glib/giochannel.inc}              //  -> gmain, gstring, gunicode, gconvert    ( Komischer Record )



