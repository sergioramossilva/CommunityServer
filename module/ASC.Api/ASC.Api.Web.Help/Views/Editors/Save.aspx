﻿<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Saving File
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Saving File</span>
    </h1>
    <p class="dscr">The reference figure and the steps below explain the process of saving the document in ONLYOFFICE™ Document Server.</p>
    <img alt="Opening File" src="<%= Url.Content("~/content/img/saving.jpg") %>" />
    <ol>
        <li>The user edits the document in the <b>document editor</b>.</li>
        <li>The <b>document editor</b> sends the changes to the <b>document editing service</b>.</li>
        <li>The user closes the <b>document editor</b>.</li>
        <li>The <b>document editing service</b> watches the end of work with the document and collects the changes send from the <b>document editor</b> into one document.</li>
        <li>The <b>document editing service</b> informs the <b>document storage service</b> about the end of the document editing using the <em>callbackUrl</em> from <a class="underline" href="<%= Url.Action("basic") %>">JavaScript API</a> and returns the link to the modified document.</li>
        <li>The <b>document storage service</b> downloads the document file with all the saved changes from the <b>document editing service</b> and stores it.</li>
    </ol>

    <h2 id="apply">How this can be done in practice</h2>
    <ol>
        <li>Create a <a class="underline" href="<%= Url.Action("callback")%>">callback handler</a> to save the document from <b>document editing service</b>.</li>
        <li>Create an <em>html</em> file to <a class="underline" href="<%= Url.Action("open")%>#apply">Open the document</a>.</li>
        <li>In the configuration script for Document Editor initialization specify the URL to the file with the <em>Callback handler</em> in the <a class="underline" href="<%= Url.Action("config/editor")%>#callbackUrl">parameter line</a>.</li>
        <li>Open your <em>html</em> file in the browser and edit your document.</li>
        <li>Close the <b>Document Editor</b>. Check out your document in about 10 seconds. All changes should be saved, meaning the configuration is correct.</li>
    </ol>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptPlaceholder"></asp:Content>
