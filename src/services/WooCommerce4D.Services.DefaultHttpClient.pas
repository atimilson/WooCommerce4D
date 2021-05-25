unit WooCommerce4D.Services.DefaultHttpClient;

interface

uses
  WooCommerce4D.Services.HttpClient,
  RestRequest4D,
  Data.DB,
  WooCommerce4D.Services.HttpClientParams;

type
  TDefaultHttpClient = class(TInterfacedObject, iHttpClient)
    private
      FParams : iParams<iHttpClient>;
      FRequest  : IRequest;
      FResponse : IResponse;
      FUrl : String;

      const
        CONTENT_TYPE = 'Content-Type';
        APPLICATION_JSON = 'application/json';
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iHttpClient;
      function Url(Value : String) : iHttpClient;
      function Params : iParams<iHttpClient>;
      function Body(Value : String) : iHttpClient;
      function Get : iHttpClient;
      function GetAll : iHttpClient;
      function Post : iHttpClient;
      function Put : iHttpClient;
      function Delete : iHttpClient;
      function DataSet(Value : TDataSet) : iHttpClient;
      function Content : String;
  end;

implementation

function TDefaultHttpClient.Body(Value: String): iHttpClient;
begin
  Result := Self;
  FRequest.AddBody(Value);
end;

function TDefaultHttpClient.Content: String;
begin
  Result := FResponse.Content;
end;

constructor TDefaultHttpClient.Create;
begin
  FRequest := TRequest.New;
end;

function TDefaultHttpClient.DataSet(Value: TDataSet): iHttpClient;
begin
  Result := Self;
  FRequest.DataSetAdapter(Value);
end;

function TDefaultHttpClient.Delete: iHttpClient;
begin
  Result := Self;
end;

destructor TDefaultHttpClient.Destroy;
begin

  inherited;
end;

function TDefaultHttpClient.Get: iHttpClient;
begin
  Result := Self;
  FRequest.Get;
end;

function TDefaultHttpClient.GetAll: iHttpClient;
begin
  Result := Self;
  Frequest.Get;
end;

class function TDefaultHttpClient.New : iHttpClient;
begin
  Result := Self.Create;
end;

function TDefaultHttpClient.Params: iParams<iHttpClient>;
begin
  FParams := THttpClientParams<iHttpClient>.New(Self, FRequest);
end;

function TDefaultHttpClient.Post: iHttpClient;
begin
  Result := Self;
  FRequest
    .AddHeader(CONTENT_TYPE, APPLICATION_JSON)
    .Post;
end;

function TDefaultHttpClient.Put: iHttpClient;
begin
  Result := Self;
  FRequest
    .AddHeader(CONTENT_TYPE, APPLICATION_JSON)
    .Put;
end;

function TDefaultHttpClient.Url(Value: String): iHttpClient;
begin
  Result := Self;
  FRequest.BaseURL(Value);
end;

end.
